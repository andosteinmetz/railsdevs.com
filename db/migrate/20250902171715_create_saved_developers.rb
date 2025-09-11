class CreateSavedDevelopers < ActiveRecord::Migration[7.0]
  def up
    create_table :saved_developers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :developer, null: false, foreign_key: true

      t.timestamps
    end
    add_index :saved_developers, [:user_id, :developer_id], unique: true
  end
  def down
    remove_index :saved_developers, [:user_id, :developer_id]
    drop_table :saved_developers
  end
end
