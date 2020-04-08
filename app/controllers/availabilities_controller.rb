class AvailabilitiesController < ApplicationController
  def new
    @availability = Availability.new
  end

  def create
    if Date.parse(params[:availability][:start_date]) < Date.today || Date.parse(params[:availability][:end_date]) < Date.today || (Date.parse(params[:availability][:start_date]) > Date.parse(params[:availability][:end_date]))
      flash[:alert] = "Enter correct date"
    else
      @availability = current_user.availabilities.create_and_save(params[:availability], current_user)
    end
    
    redirect_to new_availability_path
  end

  def delete
  end

  def show
  end

  def update
  end

  private

  def availability_params
    params.require(:availability).permit(:start_date, :end_date, :start_time, :end_time)
  end
end
