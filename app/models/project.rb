class Project < ApplicationRecord
  belongs_to :creator, foreign_key: :user_id, class_name: "User"
  has_many :pitch_decks
  has_many :likes

  validates :creator, presence: true
  validates :name, presence: true

  def current_pitch_deck
    pitch_decks.order(created_at: :desc).take
  end
end
