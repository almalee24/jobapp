class AddUserToPosition < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :user_id, :integer
  end
end
