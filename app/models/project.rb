class Project < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :pitch_deck
  has_many :likes
end
