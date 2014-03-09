class CreateGamificationTasks < ActiveRecord::Migration
  def change
    create_table :gamification_tasks do |t|
      t.references :taskable, polymorphic: true, index: true
      t.integer :points

      t.timestamps
    end
  end
end
