# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gamification_medal, :class => 'Gamification::Medal' do
    goal nil
    name "MyString"
    image "MyString"
  end
end
