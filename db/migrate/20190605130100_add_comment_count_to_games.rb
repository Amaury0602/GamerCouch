class AddCommentCountToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :comment_count, :integer, default: 0
  end
end
