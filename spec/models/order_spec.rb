require 'rails_helper'

RSpec.describe Order, type: :model do
  context "relationships" do
    it {should belong_to(:user) }
    it {should have_many(:item_orders) }
    it {should have_many(:items) }
  end
end
