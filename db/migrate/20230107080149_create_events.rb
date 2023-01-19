class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :image
      t.string :category
      t.date :date
      t.time :time
      t.text :description
      t.string :organizer
      t.string :location
      t.integer :price

      t.timestamps
    end
  end
end
