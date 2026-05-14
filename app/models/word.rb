class Word < ApplicationRecord
  has_many :word_choices
  has_many :wrong_word_choices, class_name: "WordChoice", foreign_key: :wrong_word_id
end
