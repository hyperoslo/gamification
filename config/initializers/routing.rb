module Gamification
  module ApplicationHelper

    # Knowledge base uses the layout of the client application, which causes Rails' url helpers to get confused
    # and require you to prepend 'main_app' to your own routes. This hack allows developers to keep referring to
    # routes without a prefix by sending undefined routes to 'main_app' before failing.
    def method_missing(method, *args, &block)
      if (method.to_s.end_with?('_path') || method.to_s.end_with?('_url')) && main_app.respond_to?(method)
        main_app.send(method, *args)
      else
        super
      end
    end
  end
end
