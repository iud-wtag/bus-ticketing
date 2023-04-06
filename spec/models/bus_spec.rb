require 'rails_helper'

RSpec.describe Bus do
  describe "bus model validations" do
    let!(:bus) { FactoryBot.create(:bus) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:typed) }
    it { should validate_presence_of(:brand) }
    it { should validate_presence_of(:capacity) }
    it { should validate_numericality_of(:capacity).only_integer.is_less_than_or_equal_to(50) }
    it { should validate_uniqueness_of(:name).with_message("has already been taken") }

    it "has a valid factory" do
      expect(bus).to be_valid
    end
  end  
end
