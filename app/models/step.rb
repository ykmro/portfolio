class Step < ApplicationRecord
  belongs_to :situation
  has_many :choices, dependent: :destroy

  validates :step_number, presence: true
  validates :body,        presence: true

  def next_step
    Step.where(situation_id: self.situation_id, step_number: self.step_number + 1).first
  end
end