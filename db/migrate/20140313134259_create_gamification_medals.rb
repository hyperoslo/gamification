class CreateGamificationMedals < ActiveRecord::Migration
  def change
    create_table :gamification_medals do |t|
      t.references :task, index: true
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
