require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:user) { create(:user) }
  let(:bus) { create(:bus) }
  let(:route) { create(:route) }
  let(:trip) { create(:trip, bus: bus, route: route) }
  let(:payment) { create(:payment) }
  let(:ticket) { build(:ticket, user: user, bus: bus, trip: trip, payment: payment) }

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:bus) }
    it { should belong_to(:trip) }
    it { should belong_to(:payment) }
    it { should have_many(:seats).dependent(:destroy) }
  end
  
  describe 'validations' do
    it { should validate_presence_of(:total_fare) }
  end
end
