class Base < Grape::API
  version 'v1', using: :path
  format :json
  prefix :api

  mount V1::Resources::Routes
end 