class ChangeColumnTypeDateInMenurecords < ActiveRecord::Migration
  def change
    change_column :menurecords, :date, :datetime
  end
end
