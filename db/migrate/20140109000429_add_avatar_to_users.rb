class AddAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar_file_name, :string
  end
end
