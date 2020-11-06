class AddTypeToPosition < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :job_type, :string
  end
end
