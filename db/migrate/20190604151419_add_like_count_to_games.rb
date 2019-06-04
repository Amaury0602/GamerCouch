class AddLikeCountToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :like_count, :integer, default: 0
  end
end
