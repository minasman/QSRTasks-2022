class SendDocumentationSmsJob < ApplicationJob
  queue_as :low

  def perform(documentee, message)
    if Phonelib.valid?(documentee.phone)
      TwilioClient.new.send_text(documentee, message)
    else
      TwilioClient.new.sent_text(User.find(2), "Invalid Phone for #{documentee.full_name} @ #{documentee.store.number}")
    end
  end
end
