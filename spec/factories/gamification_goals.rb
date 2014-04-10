# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gamification_goal, aliases: [:goal], class: 'Gamification::Goal' do
    rewarding nil
    points 1

    trait :with_medal do
      after :create do |goal|
        create :medal, goal: goal
      end
    end
  end
end
