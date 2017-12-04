require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Database Table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :content }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content }
  end

  context 'Factory' do
    it 'should be valid' do
      expect(FactoryBot.create(:article)).to be_valid
    end
  end

  context 'Associations' do
    it { is_expected.to have_many :comments }
  end
end
