class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name, limit: 30
      t.integer :parent_id, index: true

      t.timestamps
    end
  end
end
