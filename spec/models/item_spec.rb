require 'rails_helper'
require 'faker'

RSpec.describe Item, type: :model do
  let(:name) { Faker::Lorem.sentence }
  let(:user) { create(:user) }
  let(:public) { true }
  let(:item) { create(:item, user: user, public: public) }

  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:user) }

  it{ is_expected.to validate_length_of(:name).is_at_least(3) }

  describe "attributes" do
    it "has name and user attributes" do
      expect(item).to have_attributes(name: item.name, user: user, public: public)
    end

    it "is public by default" do
      expect(item.public).to be(true)
    end
  end
end
