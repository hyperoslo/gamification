module Gamification::Concerns::Models::Reward
  extend ActiveSupport::Concern

  included do
    belongs_to :task, class_name: 'Gamification::Task'
    belongs_to :rewardable, polymorphic: true

    validates :rewardable_id, uniqueness: { scope: [:rewardable_type, :task] }

    delegate :points, to: :task
  end
end
