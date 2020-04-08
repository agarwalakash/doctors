class Availability < ApplicationRecord
  validates :start_date, :end_date, :start_time, :end_time, presence: {message: "must be given." }
  belongs_to :user

  def self.create_and_save params, user
    if params[:start_date].present? && params[:end_date].present?
    	schedule = IceCube::Schedule.new
    	schedule.add_recurrence_rule IceCube::Rule.daily.until(params[:end_date])
    	schedule.each_occurrence  do |occurence|
    		availability = Availability.new
    		availability.start_date = Date.parse(occurence.to_s)
    		availability.end_date = params[:end_date].to_date
    		availability.start_time = params[:start_time]
    		availability.end_time = params[:end_time]
    		availability.user_id = user.id
    		availability.save(validate: true)
    	end
    end
  end
end
		