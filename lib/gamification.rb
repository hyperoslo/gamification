require "gamification/engine"
require "gamification/concerns"
require "gamification/activerecord"

require "configatron/core"

module Gamification
  class << self
    def configure
      yield config
    end

    def config
      @config ||= Configatron::Store.new

      @config.storage = :file

      @config
    end
  end
end
