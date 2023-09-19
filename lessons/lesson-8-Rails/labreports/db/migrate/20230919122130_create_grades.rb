class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.text :grade
      t.string :save

      t.timestamps
    end
  end
end
