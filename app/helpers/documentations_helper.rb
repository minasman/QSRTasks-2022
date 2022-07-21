module DocumentationsHelper
  def pending_rewards
    reward_count = 0
    users_with_rewards_pending = User.where.not('rewards = ?', '{}')
    users_with_rewards_pending.each do |user|
      reward_count += user.rewards.size
    end
    reward_count
  end
end
