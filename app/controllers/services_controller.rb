class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  before_action :set_services, only: [:index, :create]

  def index
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.creator_id = current_user.id
    if @service.save
      # rest on index page
      flash[:notice] = 'Service créé avec succes.'
      redirect_to services_path
    else
      flash[:alert] = 'Le service n\'a pas été créé. Verifiez les champs.'
      render :index
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    redirect_to services_path, notice: 'Service was successfully deleted.'
  end

  private

  def authorize_admin
    redirect_to(root_path, alert: 'Access Denied') unless current_user.has_role?(:admin)
  end

  def service_params
    params.require(:service).permit(:name, :description, :price, :duration)
  end

  def set_services
    @services = Service.all
  end

end
