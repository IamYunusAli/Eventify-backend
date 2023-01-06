class CreateReserves < ActiveRecord::Migration[7.0]
  def change
    create_table :reserves do |t|
      t.string :name
      t.date :date
      t.string :city

      t.timestamps
    end
  end
end
