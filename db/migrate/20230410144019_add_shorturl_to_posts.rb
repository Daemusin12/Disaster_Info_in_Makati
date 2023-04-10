class AddShorturlToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :short_url, :string, unique: true
  end
end
