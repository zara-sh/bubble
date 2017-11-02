class AddBookingToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :booking, foreign_key: true
  end
end
