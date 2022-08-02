class OepeImport
  include ActiveModel::Model
  require 'roo'
  attr_accessor :file

  def initialize(attributes={})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def load_imported_items
    awarded_by = User.find(2)
    spreadsheet = open_spreadsheet
    date = spreadsheet.cell(1,1).strftime("%m/%d/%Y")
    header = spreadsheet.row(2)
    (3..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      #logic to create documentation here?
      add_documentation(row, awarded_by, date)
    end
  end

  def imported_items
    @imported_items ||= load_imported_items
  end

  def save
    if load_imported_items
      true
    else
      false
    end
  end

  private

  def add_documentation(oepe_info, awarded_by, date)
    store = Store.find_by(number: oepe_info["location"].to_i)
    oepe = oepe_info["oepe"].to_i
    employee_named = store.users.where(position_id: Position.where(name: "General Manager").ids).first
    case oepe
    when 40..149
      params = {organization_id: store.organization.id, employee_named_id: employee_named.id, store_id: store.id, awarded_by_id: awarded_by.id, document_date: Date.today, position_id: employee_named.position.id, document_id: 219 , documentation_type: "Commendation", level: "Cheers!", documentation_class: "Result", description: "#{date} Peak OEPE of #{oepe} seconds", points: 2, individual: false}
      doc = Documentation.new(params)
    when 150..160
      params = {organization_id: store.organization.id, employee_named_id: employee_named.id, store_id: store.id, awarded_by_id: awarded_by.id, document_date: Date.today, position_id: employee_named.position.id, document_id: 218 , documentation_type: "Commendation", level: "Praise!", documentation_class: "Result", description: "#{date} Peak OEPE of #{oepe} seconds", points: 1, individual: false}
      doc = Documentation.new(params)
    when 161..199
      params = {organization_id: store.organization.id, employee_named_id: employee_named.id, store_id: store.id, awarded_by_id: awarded_by.id, document_date: Date.today, position_id: employee_named.position.id, document_id: 217 , documentation_type: "Exception", level: "Major", documentation_class: "Result", description: "#{date} Peak OEPE of #{oepe} seconds", points: 1, individual: false}
      doc = Documentation.new(params)
    when 200..1000
      params = {organization_id: store.organization.id, employee_named_id: employee_named.id, store_id: store.id, awarded_by_id: awarded_by.id, document_date: Date.today, position_id: employee_named.position.id, document_id: 216 , documentation_type: "Exception", level: "Serious", documentation_class: "Result", description: "#{date} Peak OEPE of #{oepe} seconds", points: 2, individual: false}
      doc = Documentation.new(params)
    else
      doc = Documentation.new
    end
    updated_points = employee_named.accumulated_points + doc.points
    employee_named.update(accumulated_points: updated_points)
    if doc && doc.save
      flow_of_accountability(doc, employee_named, params)
      SendDocumentationSmsJob.perform_later(doc.employee_named, message_to_send(doc))
      DocumentationMailer.new_documentation(doc).deliver_later
    elsif doc.errors.any?
      doc.errors.each do |error|
      end
    else
      puts "NOT A NUMBER"
    end
  end

  def message_to_send(documentation)
    if documentation.documentation_type == "Commendation"
      "You have been recognized by #{documentation.awarded_by.full_name} on #{documentation.document_date.strftime("%m/%d/%y")}: #{documentation.description}"
    else
      "Your #{documentation.documentation_class} on #{documentation.document_date.strftime("%m/%d/%y")} was identified as an exception by #{documentation.awarded_by.full_name}. Details: #{documentation.description}"
    end
  end

  def flow_of_accountability(document, named_employee, new_params)
    department = document.position.department
    position = document.position.name
    if department == "Operations"
      if position == "Crew" || position == "Manager"
        flow_list = named_employee.stores[0].users.where(active: true, position_id: Position.where(name: ["General Manager", "Supervisor", "Operations Manager", "Director"]).ids)
      elsif position == "General Manager"
        flow_list = named_employee.stores[0].users.where(active: true, position_id: Position.where(name: ["Supervisor", "Operations Manager", "Director"]).ids)
      elsif position == "Supervisor"
        flow_list = named_employee.stores[0].users.where(active: true, position_id: Position.where(name: ["Operations Manager", "Director"]).ids)
      else #Operations Manager
        flow_list = named_employee.stores[0].users.where(active: true, position_id: Position.where(name: ["Director"]).ids)
      end

    elsif department == "Maintenance"
      if position == "Maint Admin"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Department Head", "Business Director"]).ids)
      elsif position == "AA"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Department Head", "Business Director"]).ids)
      elsif position == "Maint Tech"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Tech Department Head", "Maint Department Head", "Business Director"]).ids)
      elsif position == "OTP Tech"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Technology Department Head", "Maint Department Head", "Business Director"]).ids)
      elsif position == "Patch Maint"
        flow_list = User.where(active: true, position_id: Position.where(name: ["PM Department Head", "Maint Department Head", "Business Director"]).ids)
      elsif position == "PM Department Head"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Department Head", "Business Director"]).ids)
      elsif position == "Maint Tech Department Head"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Department Head", "Business Director"]).ids)
      elsif position == "Technology Department Head"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Department Head", "Business Director"]).ids)
      else
        flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director"]).ids)
      end

    else
      if position == "HR Admin"
        flow_list = User.where(active: true, position_id: Position.where(name: ["HR Manager", "Business Director"]).ids)
      elsif position == "HR Manager"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director"]).ids)
      elsif position == "Payroll Admin"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Payroll Manager", "Business Director"]).ids)
      elsif position == "Shopper"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Department Head"]).ids)
      elsif position == "AP Admin"
        flow_list = User.where(active: true, position_id: Position.where(name: ["AP Manager", "Business Director"]).ids)
      elsif position == "AR Admin"
        flow_list = User.where(active: true, position_id: Position.where(name: ["AR Manager", "Business Director"]).ids)
      elsif position == "Marketing Admin"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Marketing Manager", "Business Director"]).ids)
      elsif position == "AP Manager"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director"]).ids)
      elsif position == "AR Manager"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director"]).ids)
      elsif position == "Marketing Manager"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director"]).ids)
      elsif position == "Payroll Manager"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director"]).ids)
      else #Business Director
        flow_list = User.where(active: true, position_id: Position.where(name: [""]).ids)
      end
    end
    flow_list.each do |employee|
      flow_document = Documentation.new(new_params)
      flow_document.employee_named = employee
      flow_document.position = employee.position
      flow_document.description = "Initial Named Employee: #{document.employee_named.full_name} at #{document.store.number}: #{document.description}"
      flow_document.save
      updated_points = employee.accumulated_points + flow_document.points
      employee.update(accumulated_points: updated_points)
    end
  end

end
