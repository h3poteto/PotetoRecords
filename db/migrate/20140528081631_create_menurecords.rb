class CreateMenurecords < ActiveRecord::Migration
  def change
    create_table :menurecords do |t|
      t.integer :parent_id
      t.string :name
      t.string :color_tag
      t.float :date

      t.timestamps
    end
  end
end
