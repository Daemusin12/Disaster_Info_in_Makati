class CreatePostDisasterShips < ActiveRecord::Migration[7.0]
  def change
    create_table :post_disaster_ships do |t|
      t.references :post
      t.references :disaster
      t.timestamps
    end
  end
end
