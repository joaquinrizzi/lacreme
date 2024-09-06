class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  before_action :set_appointment, only: %i[show edit update destroy]
  before_action :set_clients, only: %i[index edit]
  before_action :set_services, only: %i[index edit]
  before_action :set_appointments, only: %i[index create]

  def index
    @appointment = Appointment.new
  end

  def show
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user # or any other method to set the user

    if @appointment.save
      redirect_to appointments_path, notice: 'Rdv créé avec succès.'
    else
      flash.now[:alert] = 'Cet rdv n\'a pas été créé.'
      render :index
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: 'Rdv modifié avec succès.'
    else
      flash.now[:alert] = 'Cet rdv n\'a pas été modifié.'
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    flash[:notice] = 'Le rdv a été suprimé avec succès.'
    redirect_to appointments_path, status: :see_other
  end

  private

  def authorize_admin
    redirect_to(root_path, alert: 'Access refusé') unless current_user.has_role?(:admin)
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
