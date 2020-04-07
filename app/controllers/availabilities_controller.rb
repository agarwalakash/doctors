class AvailabilitiesController < ApplicationController
  def new
    @availability = Availability.new
  end

  def create
    @availability = current_user.availabilities.create_and_save(params[:availability], current_user)
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
