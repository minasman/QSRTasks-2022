class WorkorderMailer < ApplicationMailer
  default from: 'workorder@qsrtasks.com'

  def workorder(workorder)
    @workorder = workorder
    email = email_list(workorder)
    mail(to: email, subject: "New Work Order For #{Store.find(workorder.store_id).number}")
  end

  def workorder_assigned(workorder, user)
    @workorder = workorder
    @user = user
    email = email_list(workorder)
    assigned = User.find(workorder.assigned)
    mail(to: email, subject: "Work Order #{workorder.id} has been assigned to #{assigned.full_name}")
  end

  def workorder_update(workorder)
    @workorder = workorder
    email = email_list(workorder)
    @update = @workorder.workorder_updates.last
    mail(to: email, subject: "Work Order #{workorder.id} has been updated")
  end

  def workorder_closed(workorder)
    @workorder = workorder
    email = email_list(workorder)
    @update = @workorder.workorder_updates.last
    mail(to: email, subject: "Work Order #{workorder.id} has been closed by #{@update.user.full_name}")
  end

  private

  def email_list(workorder)
    email = workorder.store.users.where(active: true).uniq.reject { |u| u.position.name.in? ['Manager', 'Crew'] }.map(&:email)
    workorderAdmins = User.where(active:true, position_id: Position.where(name: 'Maint Admin').ids).map(&:email)
    email += workorderAdmins
    if workorder.assigned?
      assigned = User.find(workorder.assigned)
      email.push(assigned.email).flatten.uniq
    end
    email = email.uniq
  end
end
