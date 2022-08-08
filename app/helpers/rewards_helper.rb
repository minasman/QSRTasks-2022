module RewardsHelper
  def normalize_points(user, value)
    position = user.position.name
    if position.in? ["Crew", "Manager", "AA", "Maint Admin", "Maint Tech", "OTP Tech", "Patch Maint", "HR Admin", "AR Admin", "AP Admin", "Marketing Admin", "Payroll Admin", "Shopper", "Training Assistant"]
      value
    elsif position.in? ["General Manager", "Marketing Manager", "Training Manager", "Payroll Manager", "AP Manager", "AR Manager", "HR Manager"]
      value = value * 3
    elsif position.in? ["Supervisor", "PM Department Head", "Maint Tech Department Head", "Technology Department Head"]
      value = value * 10
    elsif position.in? ["Operations Manager", "Maint Department Head"]
      value = value * 15
    elsif position.in? ["Director", "Business Director"]
      value = value * 30
    else
      value
    end
  end
end
