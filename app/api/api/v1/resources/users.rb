module V1
  module Resources
    class Users < Grape::API
      helpers Devise::Controllers::Helpers

      resource :users do
        desc 'Returning all the users'
        get do
          User.all
        end

        desc 'Return a user'
        route_param :id do
          get do
            User.find(params[:id])
          end  
        end

        desc 'Sign Up User'
        params do
          requires :name, type: String
          requires :email, type: String
          requires :phone, type: String
          requires :password, type: String
          requires :user_name, type: String
        end
        post :sign_up do
          user = User.create!(params)
          env['warden'].set_user(user)
          { user: user, message: 'Signed up and login successfully' }
        end

        desc "Log in User"
        params do
          requires :email, type: String 
          requires :password, type: String
        end
        post :sign_in do
          email = params[:email]
          password = params[:password]

          user = User.find_for_authentication(email: email)
          if user&.valid_password?(password)
            env['warden'].set_user(user)
            { user: user, message: 'Signed in successfully' }
          else
            error!('Invalid email of password', 401)
          end
        end

        desc 'Log out user'
        before do 
          authenticate_user!
        end
        delete :sign_out do
          authenticate_user!
          env['warden'].logout
          { message: 'Logout successful' }
        end

        desc 'update a user'
        params do
          requires :id, type: String
          optional :password, type: String
        end

        route_param :id do
          put do
            authenticate_user!
            user = current_user
            user.update(params)
            { user: user, message: 'User update Successfully' }
          end        
        end

        desc 'Delete a User'
        delete do
          authenticate_user!
          user = current_user
          user.destroy
          { message: 'Account Delete Successful' }
        end
      end
    end
  end
end