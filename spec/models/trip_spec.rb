require 'rails_helper'

RSpec.describe Trip do
  describe "associations" do
    it { should belong_to(:bus) } 
    it { should belong_to(:route) } 
  end
  
  describe "validation" do
    let(:trip) { FactoryBot.create(:trip) }  

    it { should validate_presence_of(:ticket_price) }
    it { should validate_presence_of(:total_booked) }
    it { should validate_presence_of(:trip_datetime) }

    it "has a valid ticket price" do
      expect(trip.ticket_price).to be_between(500, 1000)
    end

    it "has a valid total booked value" do
      expect(trip.total_booked).to be_between(0, 50)
    end

    it "has a valid trip datetime" do
      expect(trip.trip_datetime).to be_between(DateTime.now - 1, DateTime.now)
    end

    it 'has a valid factory' do
      expect(trip).to be_valid
    end
  end  
end
