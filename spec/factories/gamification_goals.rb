# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gamification_goal, :class => 'Gamification::Goal' do
    rewarding nil
    points 1
  end
end
