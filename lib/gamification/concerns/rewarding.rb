module Gamification::Concerns::Rewarding
  extend ActiveSupport::Concern

  included do
    has_many :goals, class_name: '::Gamification::Goal', as: :rewarding
  end
end
