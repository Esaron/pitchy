class Slide < ApplicationRecord
  attr_accessor :image
  mount_uploader :image, ImageUploader

  belongs_to :pitch_deck
end
