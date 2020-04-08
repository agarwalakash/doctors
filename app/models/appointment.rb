class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  validates :appointment_date, :appointment_time, presence: {message: "should be available."}
end
