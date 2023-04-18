require 'rails_helper'

RSpec.describe User do
  let!(:user) { FactoryBot.create(:user) }
  describe "validations" do

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:user_name) }
    it { should validate_presence_of(:role) }

    it { should allow_value('+8801852463874').for(:phone) }
    it { should_not allow_value("+01asasda0").for(:phone) }

    it { should allow_value('email@example.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }
    
    it { should validate_uniqueness_of(:email).case_insensitive.with_message('has already been taken') }
    it { should validate_uniqueness_of(:user_name).with_message('has already been taken') }

    it { should define_enum_for(:role).with_values(user: 0, admin: 1) }
    
    it 'has a valid factory' do
      expect(user).to be_valid
    end
  end

  describe "associations" do
    it { should have_many(:tickets).dependent(:destroy) } 
  end
end
