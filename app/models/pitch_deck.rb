class PitchDeck < ApplicationRecord
  attr_accessor :file
  mount_uploader :file, PitchDeckUploader

  belongs_to :project
  has_many :slides
end
