class AddRoleToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :string, null: false
    add_column :users, :name, :string, null: false

  end
end
