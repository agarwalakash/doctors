class AddColumnToAppointment < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :accept_appointment, :boolean, default: nil
  end
end
