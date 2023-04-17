module V1
  module Resources
    class Buses < Grape::API
      resource :buses do
        desc 'Returning all the buses'
        get do
          Bus.all
        end

        desc 'Return a bus'
        route_param :id do
          get do
            Bus.find(params[:id])
          end  
        end

        desc 'Create a new Bus'
        params do
          requires :name, type: String
          requires :typed, type: String
          requires :brand, type: String
          requires :capacity, type: Integer
        end
        post do
          Bus.create!(params)
        end

        desc 'Update a Bus'
        params do
          requires :id, type: String
        end
        route_param :id do
          put do
            Bus.find(params[:id]).update(params)
          end
        end

        desc 'Delete a Bus'
        route_param :id do
          delete do
            Bus.find(params[:id]).destroy
          end
        end
      end
    end
  end
end
