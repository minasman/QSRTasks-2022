class DocumentationMailer < ApplicationMailer
  default from: 'documentation@qsrtasks.com'

  def new_documentation(documentation)
    @documentation = documentation
    email = distribution_list(@documentation)
    mail(to: email, subject: "#{documentation.documentation_type} generated for #{documentation.employee_named.full_name} @ #{documentation.store.number} by #{documentation.awarded_by.full_name}")
  end

  private

  def distribution_list(documentation)
    department = documentation.employee_named.position.department
    position = documentation.employee_named.position.name
    store = documentation.store
    if department == "Operations"
      flow_list = []
      if position == "Crew" || position == "Manager"
        flow_list.push(store.users.where(active: true, position_id: Position.where(name: ["Supervisor", "General Manager", "Director", "Operations Manager"]).ids, organization_id: documentation.employee_named.organization.id)).map(&:email)
      elsif position == "General Manager"
        flow_list.push(store.users.where(active: true, position_id: Position.where(name: ["Supervisor", "Operations Manager", "Director"]).ids, organization_id: documentation.employee_named.organization.id)).map(&:email)
      elsif position == "Supervisor"
        flow_list.push(store.users.where(active: true, position_id: Position.where(name: ["Operations Manager", "Director"]).ids, organization_id: documentation.employee_named.organization.id)).map(&:email)
      else
        flow_list.push(store.users.where(active: true, position_id: Position.where(name: ["Director"]).ids, organization_id: documentation.employee_named.organization.id)).map(&:email)
      end
    elsif department == "Maintenance"
      if position.== ["Maint Admin"]
        flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Department Head","Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      elsif position == "AA"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Department Head","Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      elsif position == "Maint Tech"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Tech Department Head", "Maint Department Head","Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      elsif position == "OTP Tech"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Technology Department Head", "Maint Department Head","Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      elsif position == "Patch Maint"
        flow_list = User.where(active: true, position_id: Position.where(name: ["PM Department Head", "Maint Department Head","Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      elsif position == "PM Department Head"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Department Head", "Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      elsif position == "Maint Tech Department Head"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Department Head", "Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      elsif position == "Technology Department Head"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Department Head", "Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      else
        flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      end
    elsif department == "Office"
      if position == "HR Admin"
        flow_list = User.where(active: true, position_id: Position.where(name: ["HR Manager", "Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      elsif position == "Payroll Admin"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Payroll Manager", "Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      elsif postion == "AP Admin"
        flow_list = User.where(active: true, position_id: Position.where(name: ["AP Manager", "Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      elsif position == "Shopper"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      elsif position == "AR Admin"
        flow_list = User.where(active: true, position_id: Position.where(name: ["AR Manager", "Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      elsif position == "Marketing Admin"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Marketing Manager", "Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      elsif position == "HR Manager"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      elsif position == "AP Manager"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      elsif position == "AR Manager"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      elsif position == "Marketing Manager"
        flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director", "Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      else
        flow_list = User.where(active: true, position_id: Position.where(name: ["Director"]).ids, organization_id: current_user.organization.id).map(&:email)
      end
    else
      flow_list = []
    end
  end

end
