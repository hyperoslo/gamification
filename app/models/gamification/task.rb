module Gamification
  class Task < ::ActiveRecord::Base
    include Concerns::Models::Task
  end
end
