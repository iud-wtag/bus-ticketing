require 'rails_helper'

RSpec.describe "Trips", type: :request do
  let!(:trip) { FactoryBot.create(:trip) }
  
  describe "GET /trips" do
    it "returns http success" do
      get trips_path
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get trips_path
      expect(response).to render_template(:index)
    end  

    it "assigns @trips" do
      get trips_path
      expect(assigns(:trips)).to eq([trip])
    end
  end

  describe "GET /trips/:id" do
    it "returns http success" do
      get trip_path(trip)
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get trip_path(trip)
      expect(response).to render_template(:show)
    end

    it "assigns @trip" do
      get trip_path(trip)
      expect(assigns(:trip)).to eq(trip)
    end
  end

  describe "GET /trips/new" do
    it "returns http success" do
      get new_trip_path
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get new_trip_path
      expect(response).to render_template(:new)
    end

    it "assigns @trip" do
      get new_trip_path
      expect(assigns(:trip)).to be_a_new(Trip)
    end
  end

  describe "POST /trips" do
    context "with valid params" do
      let(:valid_params) { { trip: attributes_for(:trip) } }
      
      it "creates a new trip" do
        expect{
          post trips_path, params: valid_params
        }.to change(Trip, :count).by(1) 
      end  

      it "redirects to the created trip" do
        post trips_path, params: valid_params
        expect(response).to redirect_to(Trip.last)
      end
      
      it "sets a success flash message" do
        post trips_path, params: valid_params
        expect(flash[:success]).to eq("Trip successfully created")
      end
    end

    context "with invalid params" do
      let(:invalid_params) { { trip: attributes_for(:trip, ticket_price: "letter") } }

      it "does not create a new trip" do
        expect {
          post trips_path, params: invalid_params
        }.not_to change(Trip, :count)
      end

      it "renders the new template" do
        post trips_path, params: invalid_params
        expect(response).to render_template(:new) 
      end 
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get edit_trip_path(trip)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    context "with valid parameters" do
      let(:new_attributes) { { trip: attributes_for(:trip, ticket_price:700) } }
      
      it "update the trip" do
        put trip_path(trip), params: new_attributes
        trip.reload
        expect(trip.ticket_price).to eq(700)
        
      end
      
      it "redirect to the trip show page" do
        put trip_path(trip), params: new_attributes
        expect(response).to redirect_to(trip_path(trip)) 
      end

      it "sets a success flash message" do
        put trip_path(trip), params: new_attributes
        expect(flash[:success]).to eq("Trip was successfully updated")
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { trip: attributes_for(:trip, ticket_price:"letter") } }

      it "does not update the the trips" do
        put trip_path(trip), params: invalid_attributes
        trip.reload
        expect(trip.ticket_price).to_not eq("letter")
      end

      it "returns a 422 unprocessable entity status" do
        put trip_path(trip), params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
