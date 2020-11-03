class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.string :name
      t.string :description
      t.string :company
      t.string :location

      t.timestamps
    end
  end
end
