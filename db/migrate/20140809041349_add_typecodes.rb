class AddTypecodes < ActiveRecord::Migration
  def change
    remove_column :types, :parent_id, :integer
    add_column :types, :code, :string, null: false
    add_index :types, :code, unique: true
  end
end
