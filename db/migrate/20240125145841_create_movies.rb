class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :image_url
      t.string :slug

      t.timestamps
    end
  end
end
