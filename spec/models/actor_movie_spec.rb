require 'rails_helper'

RSpec.describe ActorMovie, type: :model do
  describe "associations" do
    it { should belong_to :actor }
    it { should belong_to :movie }
  end
end
