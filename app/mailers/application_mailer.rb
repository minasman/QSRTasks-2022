class ApplicationMailer < ActionMailer::Base
  prepend_view_path 'app/views/mailer'
  layout 'mailer'
end
