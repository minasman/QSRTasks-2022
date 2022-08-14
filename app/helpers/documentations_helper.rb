module DocumentationsHelper
  def pending_rewards
    reward_count = 0
    users_with_rewards_pending = User.where.not('rewards = ?', '{}')
    users_with_rewards_pending.each do |user|
      reward_count += user.rewards.size
    end
    reward_count
  end

  def self_awarded(user)
    number = 0
    if user.employee_named_documentations.any?
      user.employee_named_documentations.each do |doc|
        if doc.awarded_by_id == user.id
          number += 1
        end
      end
    end
    number
  end
end
