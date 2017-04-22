class CreateVisitors < ActiveRecord::Migration[5.0]
  def change
    create_table :visitors do |t|
      t.string :picture
      t.string :name
      t.integer :fun
      t.timestamps
    end
  end
end
