require 'rails_helper'

RSpec.describe "Buses", type: :request do
  let!(:bus) { FactoryBot.create(:bus) }

  describe "GET /buses" do
    it "returns http success" do
      get buses_path
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get buses_path
      expect(response).to render_template(:index)
    end  

    it "assigns @buses" do
      get buses_path
      expect(assigns(:buses)).to eq([bus])
    end
  end

  describe "GET /buses/:id" do
    it "returns http success" do
      get bus_path(bus)
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get bus_path(bus)
      expect(response).to render_template(:show)
    end

    it "assigns @bus" do
      get bus_path(bus)
      expect(assigns(:bus)).to eq(bus)
    end
  end

  describe "GET /buses/new" do
    it "returns http success" do
      get new_bus_path
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get new_bus_path
      expect(response).to render_template(:new)
    end

    it "assigns @bus" do
      get new_bus_path
      expect(assigns(:bus)).to be_a_new(Bus)
    end
  end

  describe "POST /buses" do
    context "with valid params" do
      let(:valid_params) { 
        { bus: {
            name: "ENA-101",
            typed: "AC",
            brand: "Ena",
            capacity: 30
          } 
        }
      }
      
      it "creates a new bus" do
        expect{
          post buses_path, params: valid_params
        }.to change(Bus, :count).by(1) 
      end  

      it "redirects to the created bus" do
        post buses_path, params: valid_params
        expect(response).to redirect_to(Bus.last)
      end
      
      it "sets a success flash message" do
        post buses_path, params: valid_params
        expect(flash[:success]).to eq("Bus was successfully Created")
      end
    end

    context "with invalid params" do
      let(:invalid_params) { 
        { bus: {
            name: "00",
            typed: "",
            brand: "",
            capacity: 0
          } 
        }
      }

      it "does not create a new bus" do
        expect {
          post buses_path, params: invalid_params
        }.not_to change(Bus, :count)
      end

      it "renders the new template" do
        post buses_path, params: invalid_params
        expect(response).to render_template(:new) 
      end 
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get edit_bus_path(bus)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    context "with valid parameters" do
      let(:new_attributes) { 
        { bus: {
            name: "ENA-101",
            typed: "AC",
            brand: "Ena",
            capacity: 30
          } 
        }
      }
      
      it "update the bus" do
        put bus_path(bus), params: new_attributes
        bus.reload
        expect(bus.name).to eq("ENA-101")
        expect(bus.typed).to eq("AC")
        expect(bus.brand).to eq("Ena")
        expect(bus.capacity).to eq(30)
      end
      
      it "redirect to the bus show page" do
        put bus_path(bus), params: new_attributes
        expect(response).to redirect_to(bus_path(bus)) 
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { 
        { bus: {
            name: "00",
            typed: "",
            brand: "",
            capacity: 0
          } 
        }
      }

      it "does not update the the buses" do
        put bus_path(bus), params: invalid_attributes
        bus.reload
        expect(bus.name).to_not eq("00")
        expect(bus.typed).to_not eq("")
        expect(bus.brand).to_not eq("")
        expect(bus.capacity).to_not eq(0)
      end

      it "returns a 422 unprocessable entity status" do
        put bus_path(bus), params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /bus/:id" do
    it "deletes the bus" do
      expect {
        delete bus_path(bus)
      }.to change(Bus, :count).by(-1)
    end
    
    it "redirects to the root path" do
      delete bus_path(bus)
      expect(response).to redirect_to(buses_path)
    end

    it "sets a success flash message" do
      delete bus_path(bus)
      expect(flash[:success]).to eq("Bus was successfully deleted.")
    end
  end
  
end  