class AddRoleToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_doctor, :boolean, default: false
    add_column :users, :name, :string, nill: false

  end
end
