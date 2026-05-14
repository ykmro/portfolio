class CreateWordChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :word_choices do |t|
      t.references :word, null: false, foreign_key: true

      t.integer :wrong_word_id

      t.timestamps
    end

    add_foreign_key :word_choices, :words, column: :wrong_word_id
  end
end
