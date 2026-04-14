class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.references :step, null: false, foreign_key: true
      t.string :body
      t.string :feedback
      t.boolean :is_correct

      t.timestamps
    end
  end
end
