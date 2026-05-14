class StudyLog < ApplicationRecord
  belongs_to :user
  belongs_to :step
  belongs_to :word_choice
end
