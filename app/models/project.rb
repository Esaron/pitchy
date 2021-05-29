class Project < ApplicationRecord
  belongs_to :creator, foreign_key: :user_id, class_name: "User"
  has_many :pitch_decks
  has_many :likes
end
