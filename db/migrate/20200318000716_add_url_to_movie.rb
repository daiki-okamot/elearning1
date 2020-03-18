class AddUrlToMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :url, :string, null: false
  end
end
