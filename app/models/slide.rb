class Slide < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :pitch_deck

  validates :image, presence: true
  validates :pitch_deck, presence: true
end
