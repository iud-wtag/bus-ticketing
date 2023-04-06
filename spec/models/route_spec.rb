require 'rails_helper'

RSpec.describe Route do
  let!(:route) { FactoryBot.create(:route) }
  describe "validations" do

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:source) }
    it { should validate_presence_of(:destination) }
    it { should validate_uniqueness_of(:name).with_message('has already been taken') }

    
    it { should allow_value("letterOnly").for(:name) } 
    it { should allow_value("letterOnly").for(:source) } 
    it { should allow_value("letterOnly").for(:destination) } 

    it { should_not allow_value("123asdasd").for(:name) } 
    it { should_not allow_value("123asdasd").for(:source) } 
    it { should_not allow_value("123asdasd").for(:destination) } 

    it 'has a valid factory' do
      expect(route).to be_valid
    end
  end
end
