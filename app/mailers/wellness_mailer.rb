class WellnessMailer < ApplicationMailer
  def sick(wellness)
    @sick = wellness
    firstList = @sick.store.users.where(active: true).uniq.reject { |u| u.position.name.in? ["Business Director", "Manager", "Crew", "HR Manager", "Payroll Manager", "Training Manager", "AR Manager", "AP Manager", "Marketing Manager", "HR Admin", "Payroll Admin", "Training Assistant", "AR Admin", "AP Admin", "Marketing Admin", "Maint Department Head", "PM Department Head", "Maint Tech Department Head", "Maint Admin", "Technology Department Head", "OTP Tech", "Patch Maint", "Maint Tech", "AA", "Shopper"] }
    email = firstList.map(&:email).join(',')
    email += ', pruiz@staggrp.com'
    mail(from: 'wellness@qsrtasks.com', to: email, subject: "#{@sick.store.number} Wellness Check")
  end

  def sickdaily(checks)
    @checks = checks
    mail(from: 'wellness@qsrtasks.com', to: 'dhernandez@staggrp.com', subject: 'Wellness Checks Completed')
  end
end
