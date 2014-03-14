require 'carrierwave'

module Gamification::Concerns::Models::Medal
  extend ActiveSupport::Concern
  extend CarrierWave::Mount

  included do
    belongs_to :task

    mount_uploader :image, ImageUploader
  end
end
