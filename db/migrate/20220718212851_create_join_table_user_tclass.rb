class CreateJoinTableUserTclass < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :tclasses do |t|
      t.index %i[user_id tclass_id]
      t.index %i[tclass_id user_id]
    end
  end
end
