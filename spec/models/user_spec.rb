require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it { is_expected.to have_many(:items) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }

  it { is_expected.to validate_presence_of(:password) }

  describe "attributes" do
    it "responds to role" do
      expect(user).to respond_to(:role)
    end
  end

  describe "roles" do
    it "is member by default" do
      expect(user.role).to eq("member")
    end

    context "member user" do
      it "returns true for #member" do
        expect(user.member?).to be_truthy
      end
    end
  end

  describe ".avatar_url" do
    let(:known_user) { create(:user, email: "blochead@bloc.io") }

    it "returns the proper Gravatar url for a known email entity" do
      expected_gravatar = "http://gravatar.com/avatar/bb6d1172212c180cfbdb7039129d7b03.png?s=48"
      expect(known_user.avatar_url(48)).to eq(expected_gravatar)
    end
  end
end
