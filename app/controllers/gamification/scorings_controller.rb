require_dependency "gamification/application_controller"

module Gamification
  class ScoringsController < ApplicationController
    def create
      taskable.tasks.complete_for subjectable

      respond_to do |format|
        format.json { render json: {}, status: :created }
        format.html { redirect_to redirect_url }
      end
    end

    private

    def redirect_url
      params[:redirect_url] || request.env['HTTP_REFERER']
    end

    def taskable
      taskable_model.find scoring_params[:taskable_id]
    end

    def subjectable
      subjectable_model.find scoring_params[:subjectable_id]
    end

    def taskable_model
      scoring_params[:taskable_type].constantize
    end

    def subjectable_model
      scoring_params[:subjectable_type].constantize
    end

    def scoring_params
      params.require(:scoring).permit(:taskable_id, :taskable_type, :subjectable_id, :subjectable_type)
    end
  end
end
