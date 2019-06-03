class RemoveNumberFromLikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :number, :integer
  end
end
