class AddSituationToWordChoices < ActiveRecord::Migration[7.0]
  def change
    add_reference :word_choices, :situation, null: false, foreign_key: true
  end
end
