module Gamification
  module ApplicationHelper
    def complete rewarding, options
      rewardable = options[:for]
      redirect   = options[:redirect]

      form_tag Gamification::Engine.routes.url_helpers.rewards_path, method: :post do
        concat hidden_field_tag 'scoring[rewarding_tyoe]', rewarding.class.name
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
