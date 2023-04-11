require 'rails_helper'

RSpec.describe "Routes", type: :request do
  let!(:route) { FactoryBot.create(:route) }

  describe "GET /routes" do
    it "returns http success" do
      get routes_path
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get routes_path
      expect(response).to render_template(:index)
    end  

    it "assigns @routes" do
      get routes_path
      expect(assigns(:routes)).to eq([route])
    end
  end
  
  describe "GET /routes/:id" do
    it "returns http success" do
      get route_path(route)
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get route_path(route)
      expect(response).to render_template(:show)
    end

    it "assigns @route" do
      get route_path(route)
      expect(assigns(:route)).to eq(route)
    end
  end

  describe "GET /routes/new" do
    it "returns http success" do
      get new_route_path
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get new_route_path
      expect(response).to render_template(:new)
    end

    it "assigns @route" do
      get new_route_path
      expect(assigns(:route)).to be_a_new(Route)
    end
  end

  describe "POST /routes" do
    context "with valid params" do
      let(:valid_params) { 
        { route: {
            name: "CTG-DHK",
            source: "Chittagong",
            destination: "Dhaka"
          } 
        }
      }
      
      it "creates a new route" do
        expect{
          post routes_path, params: valid_params
        }.to change(Route, :count).by(1) 
      end  

      it "redirects to the created route" do
        post routes_path, params: valid_params
        expect(response).to redirect_to(Route.last)
      end
      
      it "sets a success flash message" do
        post routes_path, params: valid_params
        expect(flash[:success]).to eq("Route was successfully Created")
      end
    end

    context "with invalid params" do
      let(:invalid_params) { 
        { route: {
            name: "",
            source: "",
            destination: ""
          } 
        }
      }

      it "does not create a new route" do
        expect {
          post routes_path, params: invalid_params
        }.not_to change(Route, :count)
      end

      it "renders the new template" do
        post routes_path, params: invalid_params
        expect(response).to render_template(:new) 
      end 
    end
  end
  
  describe "GET #edit" do
    it "returns http success" do
      get edit_route_path(route)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    context "with valid parameters" do
      let(:new_attributes) { 
        { route: {
            name: "SYL-DHK",
            source: "Sylhet",
            destination: "Dhaka"
          } 
        }
      }
      
      it "update the route" do
        put route_path(route), params: new_attributes
        route.reload
        expect(route.name).to eq("SYL-DHK")
        expect(route.source).to eq("Sylhet")
        expect(route.destination).to eq("Dhaka")
      end
      
      it "redirect to the route show page" do
        put route_path(route), params: new_attributes
        expect(response).to redirect_to(route_path(route)) 
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { 
        { route: {
            name: "",
            source: "",
            destination: ""
          } 
        }
      }

      it "does not update the the routes" do
        put route_path(route), params: invalid_attributes
        route.reload
        expect(route.name).to_not eq("")
        expect(route.source).to_not eq("")
        expect(route.destination).to_not eq("")  
      end

      it "returns a 422 unprocessable entity status" do
        put route_path(route), params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /route/:id" do
    it "deletes the route" do
      expect {
        delete route_path(route)
      }.to change(Route, :count).by(-1)
    end
    
    it "redirects to the routes list" do
      delete route_path(route)
      expect(response).to redirect_to(routes_path)
    end

    it "sets a success flash message" do
      delete route_path(route)
      expect(flash[:success]).to eq("Route was successfully deleted.")
    end
  end

end
