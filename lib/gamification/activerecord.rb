module Gamification::ActiveRecord
  module Extensions

    def taskable
      has_many :tasks, class_name: 'Gamification::Task', as: :taskable
    end

    def rewardable
      has_many :scorings, class_name: 'Gamification::Scoring', as: :subjectable
    end
  end
end

::ActiveRecord::Base.send :extend, Gamification::ActiveRecord::Extensions if defined?(ActiveRecord)
