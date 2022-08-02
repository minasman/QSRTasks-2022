task update_points: :environment do
  User.all.each do |user|
    if user.employee_named_documentations.any?
      points = 0
      user.employee_named_documentations.each do |doc|
        points += doc.points
      end
      user.update(accumulated_points: points)
    end
  end
end