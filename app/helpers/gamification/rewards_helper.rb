module Gamification
  module RewardsHelper

    # Present unseen rewards for the given user.
    #
    # options - A Hash of options:
    #           for: A rewardable model.
    #
    # Returns HTML.
    def present_rewards options
      rewardable = options[:for]

      #rewardable.rewards.unseen.each do |reward|
      #  reward.seen_

      rewardable.rewards.unseen
    end
  end
end
