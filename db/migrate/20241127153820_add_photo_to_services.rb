class AddPhotoToServices < ActiveRecord::Migration[7.1]
  def change
    add_column :services, :photo, :string
  end
end
