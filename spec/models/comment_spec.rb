require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Database Table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :body }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :body }
  end

  context 'Factory' do
    it 'should be valid' do
      expect(FactoryBot.create(:comment)).to be_valid
    end
  end

  context 'Associations' do
    it { is_expected.to belong_to :article }
  end
end
