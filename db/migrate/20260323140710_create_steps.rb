class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.references :situation, null: false, foreign_key: true
      t.integer :step_number
      t.string :body

      t.timestamps
    end
  end
end
