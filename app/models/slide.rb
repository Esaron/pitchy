class Slide < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :pitch_deck
end
