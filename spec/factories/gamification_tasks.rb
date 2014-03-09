# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gamification_task, :class => 'Gamification::Task' do
    taskable nil
    points 1
  end
end
