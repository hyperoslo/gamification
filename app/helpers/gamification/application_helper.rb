module Gamification
  module ApplicationHelper

    # Create a form to reward someone for something.
    #
    # rewardable - A model that is rewardable (e.g. a user)
    # options    - A Hash of options:
    #              :for      - A model that is rewarding (e.g. an article)
    #              :redirect - A String describing a URL to redirect to.
    def reward rewardable, options
      rewarding = options[:for]
      redirect  = options[:redirect]

      form_tag Gamification::Engine.routes.url_helpers.rewards_path, method: :post do
        concat hidden_field_tag 'scoring[rewarding_type]', rewarding.class.name
        concat hidden_field_tag 'scoring[rewarding_id]', rewarding.id
        concat hidden_field_tag 'scoring[rewardable_type]', rewardable.class.name
        concat hidden_field_tag 'scoring[rewardable_id]', rewardable.id

        if redirect
          concat hidden_field_tag 'redirect_url', redirect
        end

        concat submit_tag I18n.t 'gamification.complete'
      end
    end
  end
end
