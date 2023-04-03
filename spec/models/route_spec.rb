require 'rails_helper'

RSpec.describe Route, type: :model do
  describe "validations" do
    let!(:route) { FactoryBot.create(:route) }

    it { should validate_presence_of(:route_name) }
    it { should validate_presence_of(:route_source) }
    it { should validate_presence_of(:route_destination) }
    it { should validate_uniqueness_of(:route_name).with_message('has already been taken') }

    it 'has a valid factory' do
      expect(route).to be_valid
    end
  end
end
