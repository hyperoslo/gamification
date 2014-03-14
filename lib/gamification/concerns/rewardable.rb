module Gamification::Concerns::Rewardable
  extend ActiveSupport::Concern

  included do
    has_many :rewards, class_name: '::Gamification::Reward', as: :rewardable
  end
end
