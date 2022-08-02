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
    when 150..160
      params = {organization_id: store.organization.id, employee_named_id: employee_named.id, store_id: store.id, awarded_by_id: awarded_by.id, document_date: Date.today, position_id: employee_named.position.id, document_id: 218 , documentation_type: "Commendation", level: "Praise!", documentation_class: "Result", description: "#{date} Peak OEPE of #{oepe} seconds", points: 1, individual: false}
    when 161..199
      params = {organization_id: store.organization.id, employee_named_id: employee_named.id, store_id: store.id, awarded_by_id: awarded_by.id, document_date: Date.today, position_id: employee_named.position.id, document_id: 217 , documentation_type: "Exception", level: "Major", documentation_class: "Result", description: "#{date} Peak OEPE of #{oepe} seconds", points: -1, individual: false}
    when 200..1000
      params = {organization_id: store.organization.id, employee_named_id: employee_named.id, store_id: store.id, awarded_by_id: awarded_by.id, document_date: Date.today, position_id: employee_named.position.id, document_id: 216 , documentation_type: "Exception", level: "Serious", documentation_class: "Result", description: "#{date} Peak OEPE of #{oepe} seconds", points: -2, individual: false}
    else
      params = {}
    end
    CreateOepeDocumentationJob.perform_later(params, employee_named)
  end

end
