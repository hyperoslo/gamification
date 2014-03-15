class RenameGamificationTasksToGoals < ActiveRecord::Migration
  def change
    rename_table :gamification_tasks, :gamification_goals
    rename_column :gamification_rewards, :task_id, :goal_id
    rename_column :gamification_medals, :task_id, :goal_id
  end
end
