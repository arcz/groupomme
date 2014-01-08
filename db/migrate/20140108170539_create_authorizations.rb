class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :state

      t.timestamps
    end
    
    add_index :authorizations, :user_id
    add_index :authorizations, :group_id
  end
end
