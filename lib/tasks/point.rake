task update_points: :environment do
  User.all.each do |user|
    if user.employee_named_documentations.any?
      position = user.position.name
      points = 0
      rewarded = 0
      rewards = 0
      user.employee_named_documentations.each do |doc|
        points += doc.points
      end
      if user.redeemed_rewards.any?
        user.redeemed_rewards.each do |redeemed_reward|
          redeemed_reward_value = Reward.find(redeemed_reward).value.to_i
          if position.in? ["Crew", "Manager", "AA", "Maint Admin", "Maint Tech", "OTP Tech", "Patch Maint", "HR Admin", "AR Admin", "AP Admin", "Marketing Admin", "Payroll Admin", "Shopper", "Training Assistant"]
            redeemed_reward_value
          elsif position.in? ["General Manager", "Marketing Manager", "Training Manager", "Payroll Manager", "AP Manager", "AR Manager", "HR Manager"]
            redeemed_reward_value = redeemed_reward_value * 3
          elsif position.in? ["Supervisor", "PM Department Head", "Maint Tech Department Head", "Technology Department Head"]
            redeemed_reward_value = redeemed_reward_value * 10
          elsif position.in? ["Operations Manager", "Maint Department Head"]
            redeemed_reward_value = redeemed_reward_value * 15
          elsif position.in? ["Director", "Business Director"]
            redeemed_reward_value = redeemed_reward_value * 30
          else
            redeemed_reward_value
          end
          rewarded += redeemed_reward_value
        end
      end

      if user.rewards.any?
        user.rewards.each do |reward|
          reward_value = Reward.find(reward).value.to_i
          if position.in? ["Crew", "Manager", "AA", "Maint Admin", "Maint Tech", "OTP Tech", "Patch Maint", "HR Admin", "AR Admin", "AP Admin", "Marketing Admin", "Payroll Admin", "Shopper", "Training Assistant"]
            reward_value
          elsif position.in? ["General Manager", "Marketing Manager", "Training Manager", "Payroll Manager", "AP Manager", "AR Manager", "HR Manager"]
            reward_value = reward_value * 3
          elsif position.in? ["Supervisor", "PM Department Head", "Maint Tech Department Head", "Technology Department Head"]
            reward_value = reward_value * 10
          elsif position.in? ["Operations Manager", "Maint Department Head"]
            reward_value = reward_value * 15
          elsif position.in? ["Director", "Business Director"]
            reward_value = reward_value * 30
          else
            reward_value
          end
          rewarded += reward_value
        end
      end

      points = points - rewarded
      points = points < -10 ? -10 : points
      user.update(accumulated_points: points)
    end
  end
end