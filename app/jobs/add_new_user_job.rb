class AddNewUserJob < ApplicationJob
  queue_as :low

  def perform(new_hire, organization, payroll_id)
    user = User.new(
      first_name: new_hire.first_name,
      last_name: new_hire.last_name,
      phone: new_hire.phone,
      email: new_hire.email,
      position_id: new_hire.position.id,
      organization_id: organization.id,
      rate: new_hire.rate,
      payroll_id: payroll_id,
      password: "stagg#{new_hire.social}",
      password_confirmation: "stagg#{new_hire.social}",
      birthdate: new_hire.birthdate,
      stores: [new_hire.store],
      hire_date: Date.today
    )
    user.save
  end
end
