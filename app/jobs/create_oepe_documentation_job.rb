class CreateOepeDocumentationJob < ApplicationJob
  queue_as :default

  def perform(params, employee_named)
    doc = Documentation.new(params)
    updated_points = employee_named.accumulated_points + doc.points
    employee_named.update(accumulated_points: updated_points)
    if doc && doc.save
      flow_of_accountability(doc, employee_named, params)
      SendDocumentationSmsJob.perform_later(doc.employee_named, message_to_send(doc))
      DocumentationMailer.new_documentation(doc).deliver_later
    end
  end

  private

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
      CreateDocumentationJob.perform_later(employee, new_params, document)
    end
  end


end
