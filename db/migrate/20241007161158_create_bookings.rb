class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true
      t.string :status, default: "pending"

      t.string :message
      t.date :date

      t.timestamps
    end
  end
end
