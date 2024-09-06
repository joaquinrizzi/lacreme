class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  before_action :set_services, only: %i[index create]

  def index
    @service = Service.new
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      respond_to do |format|
        format.json { render json: { success: true, service: @service } }
        format.html { redirect_to services_path, notice: 'Service modifié avec succès.' }
      end
    else
      respond_to do |format|
        format.json { render json: { success: false, errors: @service.errors.full_messages } }
        format.html { render :edit }
      end
    end
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
    redirect_to services_path, status: :see_other
  end

  private

  def authorize_admin
    redirect_to(root_path, alert: 'Access refusé') unless current_user.has_role?(:admin)
  end

  def service_params
    params.require(:service).permit(:name, :description, :price, :duration)
  end

  def set_services
    @services = Service.all
  end
end
