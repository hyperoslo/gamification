module Gamification::Concerns::Models::Reward
  extend ActiveSupport::Concern

  included do
    belongs_to :goal, class_name: 'Gamification::Goal'
    belongs_to :rewardable, polymorphic: true

    scope :unseen, -> { where seen_at: nil }
    scope :seen, -> { where.not seen_at: nil }

    scope :with_medals,    -> { all.select &:medal }
    scope :without_medals, -> { all.reject &:medal }

    validates :rewardable_id, uniqueness: { scope: [:rewardable_type, :goal] }

    delegate :points, to: :goal
    delegate :medal, to: :goal

    def see
      touch :seen_at
    end

    def seen?
      !!seen_at
    end

    class << self
      def see
        all.map { |reward| reward.see }
      end
    end
  end
end
