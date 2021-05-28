class Project < ApplicationRecord
  belongs_to :creator, foreign_key: :user_id, class_name: "User"
  belongs_to :pitch_deck, optional: true
  has_many :likes
end
