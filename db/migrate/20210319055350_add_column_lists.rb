class AddColumnLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :followed_id, :string, null: false
  end
end
