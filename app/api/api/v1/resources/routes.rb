module V1 
  module Resources
    class Routes < Grape::API
      resource :routes do
        desc 'Returning all the routes'
        get do
          Route.all
        end

        desc 'Return a route'
        route_param :id do
          get do
            Route.find(params[:id])
          end  
        end
        
        desc 'Create a new Route'
        params do
          requires :name, type: String
          requires :source, type: String
          requires :destination, type: String
        end
        post do
          Route.create!(
            {
              name: params[:name],
              source: params[:source],
              destination: params[:destination]
            }
          )
        end

        desc 'Update a Route'
        params do
          requires :id, type: String
        end
        route_param :id do
          put do
            Route.find(params[:id]).update(params)
          end
        end

        desc 'Delete a Route'
        route_param :id do
          delete do
            Route.find(params[:id]).destroy
          end
        end
        
      end
    end
  end
end
