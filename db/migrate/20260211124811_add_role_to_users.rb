class AddRoleToUsers < ActiveRecord::Migration[8.1]
  def up
    add_column :users, :name, :string
    add_column :users, :cpf, :string
    add_index :users, :cpf, unique: true

    add_column :users, :role, :integer, default: 0, null: false
  end

  def down
    remove_column :users, :role if column_exists?(:users, :role)
    remove_index :users, :cpf if index_exists?(:users, :cpf, unique: true)
    remove_column :users, :cpf if column_exists?(:users, :cpf)
    remove_column :users, :name if column_exists?(:users, :name)
  end
end
