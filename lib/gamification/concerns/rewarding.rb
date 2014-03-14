module Gamification::Concerns::Rewarding
  extend ActiveSupport::Concern

  included do
    has_many :tasks, class_name: '::Gamification::Task', as: :rewarding
  end
end
