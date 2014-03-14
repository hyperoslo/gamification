# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gamification_medal, :class => 'Medal' do
    task nil
    name "MyString"
    image "MyString"
  end
end
