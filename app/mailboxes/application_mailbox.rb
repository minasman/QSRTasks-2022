class ApplicationMailbox < ActionMailbox::Base
  routing /^guest_comment@qsrtasks/i => :guest_comment
end
