class Base < Grape::API
  version 'v1', using: :path
  format :json
  prefix :api

  use Warden::Manager do |config|
    config.serialize_into_session { |user| user.id }
    config.serialize_from_session { |id| User.find(id) }
  end

  helpers do
    def current_user
      env['warden'].user
    end
  end

  mount V1::Resources::Routes
  mount V1::Resources::Buses
  mount V1::Resources::Trips
  mount V1::Resources::Users
end 