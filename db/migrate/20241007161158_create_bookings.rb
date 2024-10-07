class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :skills, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
