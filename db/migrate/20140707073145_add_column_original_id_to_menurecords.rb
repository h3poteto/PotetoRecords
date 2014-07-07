class AddColumnOriginalIdToMenurecords < ActiveRecord::Migration
  def change
    add_column :menurecords, :original_id, :integer, after: :color_tag
  end
end
