require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:user) { FactoryBot.create(:user) }

  describe "GET /users" do
    it "returns http success" do
      get users_path
      expect(response).to have_http_status(:success)
    end
    
    it "renders the index template" do
      get users_path
      expect(response).to render_template(:index)
    end  
    
    it "assigns @users" do
      get users_path
      expect(assigns(:users)).to eq([user])
    end
  end
    
  describe "GET /users/:id" do
    it "returns http success" do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get user_path(user)
      expect(response).to render_template(:show)
    end

    it "assigns @user" do
      get user_path(user)
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET /users/new" do
    it "returns http success" do
      get new_user_path
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get new_user_path
      expect(response).to render_template(:new)
    end

    it "assigns @user" do
      get new_user_path
      expect(assigns(:user)).to be_a_new(User)
    end
  end
  
  describe "POST /users" do
    context "with valid params" do
      let(:valid_params) {
        { user: {
            name: "John Doe",
            email: "john.doe@example.com",
            password: "password",
            phone: "1234567890",
            user_name: "johndoe",
            role: "user"
          }
        }
      }
      
      it "creates a new user" do
        expect {
          post users_path, params: valid_params
        }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        post users_path, params: valid_params
        expect(response).to redirect_to(User.last)
      end

      it "sets a success flash message" do
        post users_path, params: valid_params
        expect(flash[:success]).to eq("User successfully created")
      end
    end

    context "with invalid params" do
      let(:invalid_params){
        { user: {
            name: "",
            email: "",
            password: "",
            phone: "",
            user_name: "",
            role: ""
          }
        }
      }

      it "does not create a new user" do
        expect {
          post users_path, params: invalid_params
        }.not_to change(User, :count)
      end
      
      it "renders the new template" do
        post users_path, params: invalid_params
        expect(response).to render_template(:new) 
      end  
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get edit_user_path(user)
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "PUT #update" do
    context "with valid parameters" do
      let(:new_attributes) do
        { user: {
            name: "New Name",
            email: "new.email@example.com",
            password: "new_password",
            phone: "+99876543210",
            user_name: "newusername",
            role: "admin"
          }
        }
      end

      it "updates the user" do
        put user_path(user), params: new_attributes
        user.reload
        expect(user.name).to eq("New Name")
        expect(user.email).to eq("new.email@example.com")
        expect(user.phone).to eq("+99876543210")
        expect(user.user_name).to eq("newusername")
        expect(user.role).to eq("admin")
      end

      it "redirects to the user show page" do
        put user_path(user), params: new_attributes
        expect(response).to redirect_to(user_path(user))
      end
    end
    context "with valid parameters" do
      let(:invalid_attributes) do
        { user: {
            name: "",
            email: "",
            password: "12345",
            phone: "not a phone number",
            user_name: ""
          }
        }
      end

      it "does not update the user" do
        put user_path(user), params: invalid_attributes
        user.reload
        expect(user.name).to_not eq("")
        expect(user.email).to_not eq("")
        expect(user.phone).to_not eq("not a phone number")
        expect(user.user_name).to_not eq("")
      end

      it "returns a 422 unprocessable entity status" do
        put user_path(user), params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end  
  end
  
  describe "Delete /user/:id" do
    it "deletes the user" do
      expect {
        delete user_path(user)
      }.to change(User, :count).by(-1)
    end
    it "redirects to the root path" do
      delete user_path(user)
      expect(response).to redirect_to(root_path)
    end
    it "sets a success flash message" do
      delete user_path(user)
      expect(flash[:success]).to eq("User was successfully deleted.")
    end
  end  

end
