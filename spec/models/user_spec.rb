require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
  end
  
  describe 'associations' do
    it { should belong_to(:organization) }
    it { should have_many(:addresses) }
  end

  describe '.with_organization' do
    it 'returns users with organization_id' do
      expect(described_class.with_organization).to eq([user])
    end
  end

  describe '.without_organization' do
    it 'returns users without organization_id' do
      expect(described_class.without_organization).to eq([])
    end
  end
end
