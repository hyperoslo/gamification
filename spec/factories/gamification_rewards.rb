# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gamification_reward, aliases: [:reward], class: 'Gamification::Reward' do
    goal nil
    rewardable nil
  end
end
