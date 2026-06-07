class StudyLog < ApplicationRecord
  belongs_to :user
  belongs_to :loggable, polymorphic: true

  def correct_rate
    total = loggable.steps.length
    return 0 if total.zero?
    (correct_count.to_f / total * 100).floor
  end
end
