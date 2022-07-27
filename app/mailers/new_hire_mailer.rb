class NewHireMailer < ApplicationMailer
  default from: 'welcome@qsrtasks.com'

  def welcome_email(new_hire)
    @new_hire = new_hire
    email = new_hire.email + ', dhernandez@staggrp.com'
    mail(to: email, subject: "#{@new_hire.first_name.humanize}, you're officially a member of our TEAM!! Welcome!!")
  end

  def orientation_reminder(new_hire)
    @new_hire = new_hire
    email = new_hire.email + ', dhernandez@staggrp.com'
    mail(to: email, subject: "#{@new_hire.first_name.humanize}, Reminder you are scheduled for orientation tomorrow!")
  end

  def unapproved_background(new_hire)
    @new_hire = new_hire
    email = new_hire.store.users.where(active: true, position_id: Position.where(name: ['Supervisor', 'Operations Manager', 'General Manager', 'Director', 'HR Manager', 'HR Office Admin']).ids).map(&:email)
    email << new_hire.email
    mail(to: email, subject: "#{new_hire.full_name} we are not able to offer you employment at this time")
  end

  def pending_background(new_hire)
    @new_hire = new_hire
    email = new_hire.store.users.where(active: true, position_id: Position.where(name: ['Supervisor', 'Operations Manager', 'General Manager', 'Director', 'HR Manager', 'HR Office Admin']).ids).map(&:email)
    email << new_hire.email
    mail(to: email, subject: "#{new_hire.full_name}, we are still pending your background check results")
  end

  def new_hire_removed(new_hire, store, orientation, user)
    email = store.users.where(active: true, position_id: Position.where(name: ['Supervisor', 'Operations Manager', 'General Manager', 'Director']).ids).map(&:email)
    stafflist = User.where(active: true, position_id: Position.where(name: ['HR Manager', 'HR Office Admin', 'Training Manager']).ids).map(&:email)
    email += stafflist
    email = email.uniq
    mail(to: email, subject: "#{new_hire} from #{store.number} was removed by #{user}")
  end

  def online_orientation(new_hire)
    @new_hire = new_hire
    email = new_hire.store.users.where(active: true, position_id: Position.where(name: ['Supervisor', 'Operations Manager', 'General Manager', 'Director']).ids).map(&:email)
    stafflist = User.where(active: true, position_id: Position.where(name: ['HR Manager', 'HR Admin', 'Training Manager', 'Training Assistant']).ids).map(&:email)
    email += stafflist
    email = email.uniq
    mail(to: email, subject: "#{@new_hire.store.number} submitted background for #{@new_hire.full_name} for Online Orientation")
  end

  def approved_background(new_hire)
    @new_hire = new_hire
    email = new_hire.store.users.where(active: true, position_id: Position.where(name: ['Supervisor', 'Operations Manager', 'General Manager', 'Director']).ids).map(&:email)
    stafflist = User.where(active: true, position_id: Position.where(name: ['HR Manager', 'HR Office Admin', 'Training Manager']).ids).map(&:email)
    email += stafflist
    email = email.uniq
    mail(to: email, subject: "#{@new_hire.store.number} background for #{@new_hire.full_name} has been approved")
  end

  def unapproved_background_staff(new_hire)
    @new_hire = new_hire
    email = new_hire.store.users.where(active: true, position_id: Position.where(name: ['Supervisor', 'Operations Manager', 'General Manager', 'Director']).ids).map(&:email)
    stafflist = User.where(active: true, position_id: Position.where(name: ['HR Manager', 'HR Office Admin', 'Training Manager']).ids).map(&:email)
    email += stafflist
    email = email.uniq
    mail(to: email, subject: "#{@new_hire.store.number} background for #{@new_hire.full_name} is NOT APPROVED")
  end

end
