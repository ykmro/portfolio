class Step < ApplicationRecord
  belongs_to :situation
  has_many :choices, dependent: :destroy

  validates :step_number, presence: true
  validates :body,        presence: true
end