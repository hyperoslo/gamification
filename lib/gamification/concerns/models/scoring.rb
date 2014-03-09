module Gamification::Concerns::Models::Scoring
  extend ActiveSupport::Concern

  included do
    belongs_to :task, class_name: 'Gamification::Task'
    belongs_to :subjectable, polymorphic: true

    validates :subjectable_id, uniqueness: { scope: [:subjectable_type, :task] }
  end
end
