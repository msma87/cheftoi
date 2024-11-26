class RemoveUserIdFromServices < ActiveRecord::Migration[7.1]
  def change
    remove_column :services, :user_id, :integer
  end
end
