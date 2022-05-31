require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it { should have_many(:movies)}
    it { should have_many(:actors).through(:movies)}
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
  end
end
