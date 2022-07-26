class DocumentationMailer < ApplicationMailer
  default from: 'documentation@qsrtasks.com'

  def new_documentation(documentation)
    @documentation = documentation
    email = distribution_list
    email = documentation.store.users.where(active: true).uniq.reject { |u| u.position.name.in? ["Owner", "Manager", "Crew", "HR Manager", "Payroll Manager", "Training Manager", "AR Manager", "AP Manager", "Marketing Manager", "Maint Department Head", "PM Department Head", "Maint Tech Department Head", "Technology Department Head"] }.map(&:email)
    mail(to: email, subject: "#{documentation.documentation_type} generated for #{documentation.employee_named.full_name} @ #{documentation.store.number} by #{documentation.awarded_by.full_name}")
  end

  private

  def distribution_list


  end

end


def flow_of_accountability(document, new_params)
  named_employee = User.find(document.employee_named_id)
  department = document.position.department
  position = document.position.name
  if department == "Operations"
    if position == "Crew" || position == "Manager"
      flow_list = named_employee.stores[0].users.where(position_id: Position.where(name: ["General Manager", "Supervisor", "Operations Manager", "Director"]).ids)
    elsif position == "General Manager"
      flow_list = named_employee.stores[0].users.where(position_id: Position.where(name: ["Supervisor", "Operations Manager", "Director"]).ids)
    elsif position == "Supervisor"
      flow_list = named_employee.stores[0].users.where(position_id: Position.where(name: ["Operations Manager", "Director"]).ids)
    else #Operations Manager
      flow_list = named_employee.stores[0].users.where(position_id: Position.where(name: ["Director"]).ids)
    end

  elsif department == "Maintenance"
    if position == "Maint Admin"
      flow_list = User.where(position_id: Position.where(name: ["Maint Department Head", "Business Director"]).ids)
    elsif position == "AA"
      flow_list = User.where(position_id: Position.where(name: ["Maint Department Head", "Business Director"]).ids)
    elsif position == "Maint Tech"
      flow_list = User.where(position_id: Position.where(name: ["Maint Tech Department Head", "Maint Department Head", "Business Director"]).ids)
    elsif position == "OTP Tech"
      flow_list = User.where(position_id: Position.where(name: ["Technology Department Head", "Maint Department Head", "Business Director"]).ids)
    elsif position == "Patch Maint"
      flow_list = User.where(position_id: Position.where(name: ["PM Department Head", "Maint Department Head", "Business Director"]).ids)
    elsif position == "PM Department Head"
      flow_list = User.where(position_id: Position.where(name: ["Maint Department Head", "Business Director"]).ids)
    elsif position == "Maint Tech Department Head"
      flow_list = User.where(position_id: Position.where(name: ["Maint Department Head", "Business Director"]).ids)
    elsif position == "Technology Department Head"
      flow_list = User.where(position_id: Position.where(name: ["Maint Department Head", "Business Director"]).ids)
    else
      flow_list = User.where(position_id: Position.where(name: ["Business Director"]).ids)
    end

  else
    if position == "HR Admin"
      flow_list = User.where(position_id: Position.where(name: ["HR Manager", "Business Director"]).ids)
    elsif position == "HR Manager"
      flow_list = User.where(position_id: Position.where(name: ["Business Director"]).ids)
    elsif position == "Payroll Admin"
      flow_list = User.where(position_id: Position.where(name: ["Payroll Manager", "Business Director"]).ids)
    elsif position == "Shopper"
      flow_list = User.where(position_id: Position.where(name: ["Maint Department Head"]).ids)
    elsif position == "AP Admin"
      flow_list = User.where(position_id: Position.where(name: ["AP Manager", "Business Director"]).ids)
    elsif position == "AR Admin"
      flow_list = User.where(position_id: Position.where(name: ["AR Manager", "Business Director"]).ids)
    elsif position == "Marketing Admin"
      flow_list = User.where(position_id: Position.where(name: ["Marketing Manager", "Business Director"]).ids)
    elsif position == "AP Manager"
      flow_list = User.where(position_id: Position.where(name: ["Business Director"]).ids)
    elsif position == "AR Manager"
      flow_list = User.where(position_id: Position.where(name: ["Business Director"]).ids)
    elsif position == "Marketing Manager"
      flow_list = User.where(position_id: Position.where(name: ["Business Director"]).ids)
    elsif position == "Payroll Manager"
      flow_list = User.where(position_id: Position.where(name: ["Business Director"]).ids)
    else #Business Director
      flow_list = User.where(position_id: Position.where(name: [""]).ids)
    end
  end
  flow_list.each do |employee|
    flow_document = Documentation.new(new_params)
    flow_document.employee_named = employee
    flow_document.position = employee.position
    flow_document.description = "Initial Named Employee: #{document.employee_named.full_name} at #{document.store.number}: #{document.description}"
    flow_document.save
    updated_points = flow_document.employee_named.accumulated_points + flow_document.points
    flow_document.employee_named.update(accumulated_points: updated_points)
  end
end
