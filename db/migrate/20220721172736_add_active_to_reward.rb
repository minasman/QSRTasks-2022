class AddActiveToReward < ActiveRecord::Migration[7.0]
  def change
    add_column :rewards, :active, :boolean, default: true
  end
end
