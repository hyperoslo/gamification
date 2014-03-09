# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gamification_scoring, :class => 'Gamification::Scoring' do
    task nil
    subjectable nil
  end
end
