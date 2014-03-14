module Gamification::ActiveRecord
  module Extensions
    def rewarding
      include Gamification::Concerns::Rewarding
    end

    def rewardable
      include Gamification::Concerns::Rewardable
    end
  end
end

::ActiveRecord::Base.send :extend, Gamification::ActiveRecord::Extensions if defined?(ActiveRecord)
