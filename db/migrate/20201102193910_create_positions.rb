class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.string :title
      t.string :description
      t.string :company
      t.string :location
      t.string :url 

      t.timestamps
    end
  end
end
