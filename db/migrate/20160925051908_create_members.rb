class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :picture
      t.string :name
      t.belongs_to :place
      t.string :fun
      t.timestamps
    end
  end
end
