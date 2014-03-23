require 'carrierwave'

module Gamification
  module Concerns::Models::Medal
    extend ActiveSupport::Concern

    included do
      belongs_to :goal

      mount_uploader :image, ImageUploader
    end
  end
end
