class AddHoursToParticipants < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :hours, :decimal
  end
end
