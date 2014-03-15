module Gamification::Concerns::Rewardable
  extend ActiveSupport::Concern

  included do
    has_many :rewards, class_name: '::Gamification::Reward', as: :rewardable

    def medals
      rewards.map(&:goal).map(&:medal).flatten
    end
  end
end
