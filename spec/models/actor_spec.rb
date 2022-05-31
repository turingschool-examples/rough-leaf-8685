require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should belong_to :movies }
    it { should have_many(:studios).through(:movies) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
  end
end
