class AddFinishAtToRental < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :finish_at, :datetimes
  end
end
