class Like < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :project, presence: true
  validates :user, presence: true
end
