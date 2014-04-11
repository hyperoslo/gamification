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
      rewards      = rewardable.rewards.unseen
      presentation = render partial: 'gamification/rewards/presentation', locals: { rewards: rewards }

      rewards.see

      presentation
    end
  end
end
