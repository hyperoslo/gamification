require_dependency "gamification/application_controller"

module Gamification
  class RewardsController < ApplicationController
    include Gamification::Concerns::Controllers::RewardsController
  end
end
