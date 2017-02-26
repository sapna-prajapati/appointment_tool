class ClientsController < ApplicationController
  def index
    @slots = Slot.eager_load(:appointments)
  end

  def new
    @client = Client.new
    @client.appointments.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @client = Client.new(client_params)       
    if @client.save     
      redirect_to clients_path, notice: 'Appointment was successfully created.'
    else
      render 'new'
    end
  end

  private
  def client_params
    params.require(:client).permit(:name, :mobile, :email, appointments_attributes: [:slot_id, :date_created])
  end
end
