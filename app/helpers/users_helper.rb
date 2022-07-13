module UsersHelper
  def sort_link_to(name, column, **options)
    if params[:sort] == column.to_s
      direction = params[:direction] == "asc" ? "desc" : "asc"
    else
      direction = "asc"
    end
    link_to name, request.params.merge(sort: column, direction: direction), **options
  end

  def redeemed_dollars(user)
    dollars = 0
    user.redeemed_rewards.each do |reward|
      dollars += Reward.find(reward).value
    end
    dollars
  end
end