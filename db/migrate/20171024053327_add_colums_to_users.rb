class AddColumsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users,  :name, :string
    add_column :users, :phone, :string
    add_column :users, :bio, :text
    add_column :users, :hobbies, :text
  end
end
