class AddTypeToPosition < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :jobtype, :string
  end
end
