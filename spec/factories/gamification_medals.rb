# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gamification_medal, aliases: [:medal], class: 'Gamification::Medal' do
    goal nil
    name Faker::Lorem.word
    description Faker::Lorem.sentence
    image 'http://example.org'
  end
end
