class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
  end

  private

  def appointtment_params
    params.require(:appointment).permit(:date, :time, :service_id, :user_id)
  end
end
