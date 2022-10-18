class AddFieldsToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :year, :string
  end
end
