require 'rails_helper'

RSpec.describe Address, type: :model do
  let!(:address) { create(:address) }
  
  describe 'associations' do
    it { should belong_to(:user) }
  end
end
