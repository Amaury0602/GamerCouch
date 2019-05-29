class AddNumberToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :number, :integer, default: 0
  end
end
