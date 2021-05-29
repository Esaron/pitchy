class PitchDeck < ApplicationRecord
  mount_uploader :file, PitchDeckUploader

  belongs_to :project
  has_many :slides
end
