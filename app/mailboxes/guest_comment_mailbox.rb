class GuestCommentMailbox < ApplicationMailbox
  def process
    puts "THIS IS WHERE THIS MAIL IS FROM #{mail.from}"
  end
end
