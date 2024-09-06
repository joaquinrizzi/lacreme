class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_clients, only: [:index]
  before_action :set_services, only: [:index]
  before_action :set_appointments, only: [:index, :create]

  def index
    @appointment = Appointment.new
  end

  # def new
  #   @appointment = Appointment.new
  # end

  def show
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user # or any other method to set the user

    if @appointment.save
      redirect_to appointments_path, notice: 'Appointment was successfully created.'
    else
      flash.now[:alert] = 'Appointment was not created.'
      render :index
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: 'Appointment was successfully updated.'
    else
      flash.now[:alert] = 'Appointment was not updated.'
      render :edit
    end

  end

  def destroy
    if @appointment.destroy
      redirect_to appointments_path, notice: 'Appointment was successfully deleted.'
    else
      redirect_to appointments_path, alert: 'Appointment could not be deleted.'
    end
  end

  private

  def authorize_admin
    redirect_to(root_path, alert: 'Access Denied') unless current_user.has_role?(:admin)
  end

  def appointment_params
    params.require(:appointment).permit(:date, :time, :service_id, :client_id)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_clients
    @clients = Client.all.pluck(:last_name, :id) # Assuming Client model has 'name' and 'id' attributes
  end

  def set_services
    @services = Service.all.pluck(:name, :id) # Assuming Service model has 'name' and 'id' attributes
  end

  def set_appointments
    @appointments = Appointment.all
  end
end
