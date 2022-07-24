class WellnessMailer < ApplicationMailer
  def sick(wellness)
    @sick = wellness
    firstList = @sick.store.users.uniq.reject { |u| u.position.name.in? ['Manager', 'Crew'] }
    email = firstList.map(&:email).join(',')
    email += ', pruiz@staggrp.com'
    mail(from: 'wellness@qsrtasks.com', to: email, subject: "#{@sick.store.number} Wellness Check")
  end

  def sickdaily(checks)
    @checks = checks
    mail(from: 'wellness@qsrtasks.com', to: 'dhernandez@staggrp.com', subject: 'Wellness Checks Completed')
  end
end
