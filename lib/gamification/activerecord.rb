module Gamification::ActiveRecord
  module Extensions
    def rewarding
      has_many :tasks, class_name: 'Gamification::Task', as: :rewarding
    end

    def rewardable
      has_many :rewards, class_name: 'Gamification::Rewards', as: :rewardable
    end
  end
end

::ActiveRecord::Base.send :extend, Gamification::ActiveRecord::Extensions if defined?(ActiveRecord)
