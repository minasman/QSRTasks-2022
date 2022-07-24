class SendHireSmsJob < ApplicationJob
  queue_as :low

  def perform(new_hire, message)
    list = []
    list << new_hire.store.users.where(position_id: Position.where(name: 'General Manager').ids).first
    list << new_hire.store.users.where(position_id: Position.where(name: 'Supervisor').ids).first
    list += User.where(active: true, position_id: Position.where(name: ['Director']).ids)
    list.flatten
    list.each do |user|
      if Phonelib.valid?(user.phone)
        TwilioClient.new.send_text(user, message)
      end
    end
  end
end
