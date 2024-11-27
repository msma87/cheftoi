class AddImageUrlToServices < ActiveRecord::Migration[7.1]
  def change
    add_column :services, :image_url, :string
  end
end
