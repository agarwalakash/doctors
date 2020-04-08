class AppointmentsController < ApplicationController
  def index
    @appointments = current_user.appointments
  end

  def new
    @appointment = Appointment.new
  end

  def create
    if params[:appointment][:appointment_date].present?
      if Date.parse(params[:appointment][:appointment_date]) < Date.today
        flash[:alert] = "Choose correct date."
      elsif duplicate_appointment.present?
        flash[:alert] = "You have already an Appointment in this time slot."
      elsif !check_doctor_availability.present?
        flash[:alert] = "Doctor is not available on this slot."
      else
        params[:appointment][:doctor_id] = Doctor.find(params[:appointment][:doctor]).id
        @appointment = current_user.appointments.create(appointment_params)
        @appointment.save
      end
    else
      flash[:alert] = "Choose date."
    end
    redirect_to new_appointment_path
  end

  def update
    
  end

  def show
  end

  def delete
  end

  def accept
    Appointment.find(params[:id]).update_attributes(accept_appointment: params[:accept])
    redirect_back(fallback_location: root_path)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :appointment_time, :doctor_id)
  end

  def duplicate_appointment
    appointments = current_user.appointments.where(appointment_date: params[:appointment][:appointment_date]).where(appointment_time: Time.parse(params[:appointment][:appointment_time]).strftime("%H:%M")..(Time.parse(params[:appointment][:appointment_time]) + 1.hour).strftime("%H:%M"))
  end

  def check_doctor_availability
    doctors = Doctor.find(params[:appointment][:doctor]).availabilities.where(start_date: params[:appointment][:appointment_date]).where("start_time >= ? AND end_time <= ?", Time.parse(params[:appointment][:appointment_time]).strftime("%H:%M"), Time.parse(params[:appointment][:appointment_time]).strftime("%H:%M"))
  end

end
