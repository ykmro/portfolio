class CreateSituations < ActiveRecord::Migration[7.2]
  def change
    create_table :situations do |t|
      t.string :title
      t.string :overview
      t.string :scenario
      t.string :thumbnail

      t.timestamps
    end
  end
end
