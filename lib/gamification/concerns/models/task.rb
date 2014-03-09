module Gamification::Concerns::Models::Task
  extend ActiveSupport::Concern

  included do
    belongs_to :taskable, polymorphic: true
    has_many :scorings

    # Determine whether the given subject has completed the task.
    #
    # subject - An ActiveRecord model that can receive scorings.
    def completed_by? subject
      !!scoring_for(subject)
    end

    # Complete the task for the given subject.
    #
    # subject - An ActiveRecord model that can receive scorings.
    def complete_for subject
      if completed_by? subject
        raise Completed, "Task is already completed for #{subject}"
      else
        ::Gamification::Scoring.create! task: self, subjectable: subject
      end
    end

    private

    # Find the Scoring for the given subject.
    #
    # subject - An ActiveRecord model that can receive scorings.
    def scoring_for subject
      scorings.find_by subjectable: subject
    end

    class Completed < StandardError; end
  end

  module ClassMethods
    # Complete all tasks for the given subject.
    #
    # subject - An ActiveRecord model that can receive scorings.
    def complete_for subject
      all.map { |task| task.complete_for subject unless task.completed_by? subject }.compact
    end
  end
end
