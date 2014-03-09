module Gamification
  class Engine < ::Rails::Engine
    isolate_namespace Gamification

    initializer 'gamification.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper Gamification::ApplicationHelper
      end
    end

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
