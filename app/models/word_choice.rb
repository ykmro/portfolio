class WordChoice < ApplicationRecord
  belongs_to :situation
  belongs_to :word
  belongs_to :wrong_word, class_name: "Word"

  has_many :study_logs, as: :loggable
end
