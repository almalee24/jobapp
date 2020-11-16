class AddPositionIdToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :position_id, :integer
  end
end
