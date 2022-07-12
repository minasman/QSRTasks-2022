class AddPointsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :accumulated_points, :integer, default: 0
    add_column :users, :rewards, :integer, array: true, default: []
    add_column :users, :redeemed_rewards, :integer, array: true, default: []
  end
end
