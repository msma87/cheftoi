class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :title
      t.string :category
      t.float :price
      t.integer :user_id

      t.timestamps
    end
  end
end
