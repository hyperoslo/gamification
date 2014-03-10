# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gamification_reward, :class => 'Gamification::Reward' do
    task nil
    rewardable nil
  end
end
