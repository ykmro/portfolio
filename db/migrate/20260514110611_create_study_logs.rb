class CreateStudyLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :study_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :step, null: true, foreign_key: true
      t.references :word_choice, null: true, foreign_key: true

      t.integer :correct_count
      t.datetime :studied_at

      t.timestamps
    end
  end
end
