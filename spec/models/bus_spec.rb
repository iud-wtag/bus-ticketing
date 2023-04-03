require 'rails_helper'

RSpec.describe Bus, type: :model do
  describe "bus model validations" do
    let!(:bus) {FactoryBot.create(:bus)}

    it { should validate_presence_of(:bus_name) }
    it { should validate_presence_of(:bus_type) }
    it { should validate_presence_of(:bus_brand) }
    it { should validate_presence_of(:bus_capacity) }
    it { should validate_numericality_of(:bus_capacity).only_integer.is_less_than_or_equal_to(50) }
    it { should validate_uniqueness_of(:bus_name).with_message("has already been taken") }

    it "has a valid factory" do
      expect(bus).to be_valid
    end
  end  
end
