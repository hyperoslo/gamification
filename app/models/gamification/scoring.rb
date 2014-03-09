module Gamification
  class Scoring < ActiveRecord::Base
    belongs_to :task
    belongs_to :subjectable, polymorphic: true
  end
end
