module Gamification::Concerns::Models::Scoring
  extend ActiveSupport::Concern

  included do
    belongs_to :task
    belongs_to :subjectable, polymorphic: true
  end
end
