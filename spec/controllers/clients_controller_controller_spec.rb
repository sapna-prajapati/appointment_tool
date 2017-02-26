require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  describe "GET index" do
    it "assigns @slots" do
      slots = Slot.all
      get :index
      expect(assigns(:slots).pluck('id')).to eq(slots.pluck('id'))
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it "assigns a new client to @client" do
      xhr :get, 'new'
      expect(assigns(:client)).to be_a_new(Client)
    end

    it "renders the :new template" do      
      xhr :get, 'new'
      expect(response).to render_template :new      
    end    
  end

  describe "POST #create" do
      context "with valid attributes" do
        client_params = {name: "jhon", mobile: "9898755345", email: "jhon@mailinator.com",appointments_attributes: {"0"=>{slot_id: Slot.last, date_created: Date.today}}}


        it "creates client appointment" do          
          expect{post :create, client: client_params}.to change(Client, :count).by(1)
        end
        it "redirects to client#index" do          
          post :create, client: client_params
          expect(response).to redirect_to clients_path
        end
      end

      context "with invalid attributes" do
        client_params = {name: "", mobile: "", email: "jhon@mailinator.com",appointments_attributes: {"0"=>{slot_id: Slot.first, date_created: Date.today+2.days}}}

        it "does not save the client appointment" do
          expect{post :create, client: client_params, format: :js}.to_not change(Client, :count)
        end

        it "re-renders the :new template" do
          post :create, client: client_params, format: :js
          expect(response).to render_template :new
        end
      end
    end

end
