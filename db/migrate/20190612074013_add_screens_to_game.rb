class AddScreensToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :screens, :text, array: true, default: []
  end
end
