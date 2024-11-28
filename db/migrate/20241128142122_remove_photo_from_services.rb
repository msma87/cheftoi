class RemovePhotoFromServices < ActiveRecord::Migration[7.1]
  def change
    remove_column :services, :photo, :string
  end
end
