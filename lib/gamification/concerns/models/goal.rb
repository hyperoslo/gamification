module Gamification::Concerns::Models::Goal
  extend ActiveSupport::Concern

  included do
    belongs_to :rewarding, polymorphic: true
    has_one :medal
    has_many :rewards

    accepts_nested_attributes_for :medal

    # TODO: These should be SQL. But that's hard.
    scope :completed_by,  ->(subject) { all.select { |goal| goal.completed_by? subject }}
    scope :incomplete_by, ->(subject) { all.reject { |goal| goal.completed_by? subject }}

    # Determine whether the given subject has completed the goal.
    #
    # subject - An ActiveRecord model that can receive rewards.
    def completed_by? subject
      !!reward_for(subject)
    end

    # Complete the goal for the given subject.
    #
    # subject - An ActiveRecord model that can receive rewards.
    def complete_for subject
      if completed_by? subject
        raise Completed, "Task is already completed for #{subject}"
      else
        ::Gamification::Reward.create! goal: self, rewardable: subject
      end
    end

    private

    # Find the Reward for the given subject.
    #
    # subject - A rewardable model.
    def reward_for rewardable
      rewards.find_by rewardable: rewardable
    end

    class Completed < StandardError; end
  end

  module ClassMethods
    # Complete all goals for the given subject.
    #
    # subject - An ActiveRecord model that can receive rewards.
    def complete_for subject
      all.map { |goal| goal.complete_for subject unless goal.completed_by? subject }.compact
    end
  end
end
