class AddDescriptionToGamificationMedals < ActiveRecord::Migration
  def change
    add_column :gamification_medals, :description, :text
  end
end
