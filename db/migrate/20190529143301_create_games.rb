class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :year
      t.string :category
      t.string :platform

      t.timestamps
    end
  end
end
