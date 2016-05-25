class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.text :notes
      t.integer :user_id
      t.string :category
      t.integer :city_id
      t.string :image
      t.string :name

      t.timestamps

    end
  end
end
