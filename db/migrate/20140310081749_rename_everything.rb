class RenameEverything < ActiveRecord::Migration
  def change
    rename_table :gamification_scorings, :gamification_rewards
    rename_column :gamification_rewards, :subjectable_id, :rewardable_id
    rename_column :gamification_rewards, :subjectable_type, :rewardable_type

    rename_column :gamification_tasks, :taskable_id, :rewarding_id
    rename_column :gamification_tasks, :taskable_type, :rewarding_type
  end
end
