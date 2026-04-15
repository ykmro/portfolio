class Situation < ApplicationRecord
  has_many :steps, dependent: :destroy

  validates :title,    presence: true
  validates :overview, presence: true
  validates :scenario, presence: true
end
