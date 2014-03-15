module Gamification::Concerns::Models::Reward
  extend ActiveSupport::Concern

  included do
    belongs_to :goal, class_name: 'Gamification::Goal'
    belongs_to :rewardable, polymorphic: true

    validates :rewardable_id, uniqueness: { scope: [:rewardable_type, :goal] }

    delegate :points, to: :goal
    delegate :medal, to: :goal
  end
end
