class RemoveCompanyFromPositions < ActiveRecord::Migration[6.0]
  def change
    remove_column :positions, :company, :string
    remove_column :positions, :location, :string
    remove_column :positions, :url, :string
  end
end