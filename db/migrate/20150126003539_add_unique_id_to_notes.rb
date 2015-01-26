class AddUniqueIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :uid, :string
    add_index :notes, :uid
  end
end
