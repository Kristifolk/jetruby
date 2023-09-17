class CreateLabreports < ActiveRecord::Migration[7.0]
  def change
    create_table :labreports do |t|
      t.string :user_id
      t.string :number_report
      t.text :title
      t.text :description
      t.text :file_name
      t.string :grade

      t.timestamps
    end
  end
end
