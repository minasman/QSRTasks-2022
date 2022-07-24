class CovidMailer < ApplicationMailer
  def fully(covid_status)
    @covid_status = covid_status
    covid_status.pictures.each do |pic|
      attachments[pic.filename.to_s] = pic.download
    end
    mail(from: 'admin@qsrtasks.com', to: 'dhernandez@staggrp.com, cramirez@staggrp.com',  subject: "#{covid_status.full_name} is now fully vaccinated!!")
  end
end