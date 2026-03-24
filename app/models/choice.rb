class Choice < ApplicationRecord
  belongs_to :step

  validates :body,     presence: true
  validates :feedback, presence: true
  validates :is_correct,  inclusion: { in: [true, false] }
end