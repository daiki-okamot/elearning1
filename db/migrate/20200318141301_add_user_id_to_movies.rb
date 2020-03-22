class AddUserIdToMovies < ActiveRecord::Migration[6.0]
  def change
    add_reference :movies, :user, foreign_key: true, index: true, after: :title
  end
end
