module Gamification
  class Goal < ::ActiveRecord::Base
    include Concerns::Models::Goal
  end
end
