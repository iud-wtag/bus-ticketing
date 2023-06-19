require 'rails_helper'

RSpec.describe Bus do
  let!(:bus) { FactoryBot.create(:bus) }
  describe "bus model validations" do

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:typed) }
    it { should validate_presence_of(:brand) }
    it { should validate_presence_of(:capacity) }
    it { should validate_numericality_of(:capacity).only_integer.is_less_than_or_equal_to(50) }
    it { should validate_uniqueness_of(:name).with_message("has already been taken") }

    it { should allow_value("letterOnly").for(:brand) }
    it { should allow_value("nospace-123").for(:name) }

    it { should_not allow_value("123somevalue").for(:brand) } 
    it { should_not allow_value("space text").for(:name) } 

    it { should define_enum_for(:typed).with_values(AC: 0, NON_AC: 1) }
    
    it "has a valid factory" do
      expect(bus).to be_valid
    end
  end

  describe "bus model association" do
    it { should have_many(:seats).dependent(:destroy) } 
    it { should have_many(:tickets).dependent(:destroy) } 
    it { should have_one(:trip).dependent(:destroy) }
  end
end
