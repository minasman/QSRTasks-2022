task wellness: :environment do
  Wellness.send_update
  Wellness.update_reported
end
