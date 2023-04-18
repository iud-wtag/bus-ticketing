module V1
  module Resources
    class Trips < Grape::API
      resource :trips do
        desc 'Returning all the trips'
        get do
          Trip.all
        end

        desc 'Return a trip'
        route_param :id do
          get do
            Trip.find(params[:id])
          end  
        end

        desc 'Create a new Trip'
        params do
          requires :ticket_price, type: Integer
          requires :total_booked, type: Integer
          requires :trip_datetime, type: DateTime
          requires :bus_id, type: Integer
          requires :route_id, type: Integer
        end
        post do
          Trip.create!(params)
        end

        desc 'Update a Trip'
        params do
          requires :id, type: String
        end
        route_param :id do
          put do
            Trip.find(params[:id]).update(params)
          end
        end

        desc 'Delete a Trip'
        route_param :id do
          delete do
            Trip.find(params[:id]).destroy
          end
        end
      end
    end
  end
end
