class RemoveFinishAtFromRental < ActiveRecord::Migration[5.2]
  def change
    remove_column :rentals, :finish_at, :datetime
  end
end
