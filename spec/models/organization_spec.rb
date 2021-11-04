require 'rails_helper'

RSpec.describe Organization, type: :model do
  let!(:organization) { create(:organization) }
  
  describe 'associations' do
    it { should have_many(:users) }
  end
end
