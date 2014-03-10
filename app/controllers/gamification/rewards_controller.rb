require_dependency "gamification/application_controller"

module Gamification
  class RewardsController < ApplicationController
    def create
      rewarding.tasks.complete_for rewardable

      respond_to do |format|
        format.json { render json: {}, status: :created }
        format.html { redirect_to redirect_url }
      end
    end

    private

    def redirect_url
      params[:redirect_url] || request.env['HTTP_REFERER']
    end

    def rewarding
      rewarding_model.find scoring_params[:rewarding_id]
    end

    def rewardable
      rewardable_model.find scoring_params[:rewardable_id]
    end

    def rewarding_model
      scoring_params[:rewarding_type].constantize
    end

    def rewardable_model
      scoring_params[:rewardable_type].constantize
    end

    def scoring_params
      params.require(:scoring).permit(:rewarding_type, :rewarding_id, :rewardable_type, :rewardable_id)
    end
  end
end
