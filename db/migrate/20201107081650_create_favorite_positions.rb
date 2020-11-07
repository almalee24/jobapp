class CreateFavoritePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_positions do |t|
      t.integer :position_id
      t.integer :user_id

      t.timestamps
    end
  end
end
