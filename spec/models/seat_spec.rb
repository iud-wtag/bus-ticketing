require 'rails_helper'

RSpec.describe Seat do
  let(:seat) { FactoryBot.create(:seat) }  
  describe "validations of Seat" do
 
    it { should validate_presence_of(:name) }
    it { should allow_value("A1").for(:name) } 
    it { should_not allow_value("A 1").for(:name) } 
    
    it 'has a valid factory' do
      expect(seat).to be_valid
    end
  end
  describe "association of Seat" do
    it { should belong_to(:bus) } 
  end
end
