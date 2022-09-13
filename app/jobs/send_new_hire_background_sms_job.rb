class SendNewHireBackgroundSmsJob < ApplicationJob
  queue_as :default

  def perform(new_hire, message)
    list = new_hire.store.users.where(position_id: Position.where(name: ["General Manager", "Supervisor", "Operations Manager", "Director"]).ids)

    list.each do |user|
      if Phonelib.valid?(user.phone)
        TwilioClient.new.send_text(user, message)
      end
    end
  end
end
