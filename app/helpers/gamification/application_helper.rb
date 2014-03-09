module Gamification
  module ApplicationHelper
    def complete taskable, options
      subjectable = options[:for]

      form_tag Gamification::Engine.routes.url_helpers.scorings_path, method: :post do
        concat hidden_field_tag 'scoring[taskable_type]', taskable.class.name
        concat hidden_field_tag 'scoring[taskable_id]', taskable.id
        concat hidden_field_tag 'scoring[subjectable_type]', subjectable.class.name
        concat hidden_field_tag 'scoring[subjectable_id]', subjectable.id

        concat submit_tag I18n.t 'gamification.complete'
      end
    end
  end
end
