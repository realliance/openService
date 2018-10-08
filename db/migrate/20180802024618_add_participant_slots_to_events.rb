class AddParticipantSlotsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :participant_slots, :integer
  end
end
