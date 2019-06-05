class AddPreferGameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :game1, :string
    add_column :users, :game2, :string
    add_column :users, :game3, :string
  end
end
