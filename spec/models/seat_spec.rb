require 'rails_helper'

RSpec.describe Seat do
  describe "validations of Seat" do
    let(:seat) { FactoryBot.create(:seat) }  
 
    it { should validate_presence_of(:seat_name) }
    it { should validate_presence_of(:seat_booked) } 
    it { should belong_to(:bus) } 

    it 'has a valid factory' do
      expect(seat).to be_valid
    end
  end
end
