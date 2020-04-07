class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :doctor
      t.belongs_to :patient
      t.date :appointment_date
      t.time :appointment_time

      t.timestamps
    end
  end
end
