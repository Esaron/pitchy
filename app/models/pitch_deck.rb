class PitchDeck < ApplicationRecord
  belongs_to :project
  has_many :slides
end
