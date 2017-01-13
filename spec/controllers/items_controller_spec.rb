require 'rails_helper'
require 'faker'

RSpec.describe ItemsController, type: :controller do
  let(:name) { Faker::Lorem.sentence }
  let(:my_user) { create(:user) }
  let(:other_user) { User.create!(email: "user@bloccit.com", password: "helloworld", role: :member) }
  let(:my_item) { create(:item, user: my_user) }

  context "guest" do
    describe "POST create" do
      it "returns http redirect" do
        post :create, user_id: my_user.id, item: { name: name } # rubocop:disable HttpPositionalArguments
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "DELETE destroy" do
      it "returns unauthorized" do
        delete :destroy, format: :js, user_id: my_user.id, id: my_item.id
        expect(response).to have_http_status(401)
      end
    end
  end

  context "member user doing CRUD on an item they don't own" do
    before do
      @user = other_user
      sign_in @user
    end

    describe "POST create" do
      it "increases the number of Items by 1" do
        expect { post :create, user_id: my_user.id, item: { name: name } }.to change(Item, :count).by(1) # rubocop:disable HttpPositionalArguments, Metrics/LineLength
      end

      it "assigns the new item to @item" do
        post :create, user_id: my_user.id, item: { name: name } # rubocop:disable HttpPositionalArguments
        expect(assigns(:item)).to eq Item.last
      end

      it "redirects to the new item" do
        post :create, user_id: my_user.id, item: { name: name } # rubocop:disable HttpPositionalArguments
        expect(response).to redirect_to root_path
      end
    end

    describe "DELETE destroy" do
      it "returns error" do
        expect { delete :destroy, format: :js, user_id: my_user.id, id: my_item.id }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  context "member user doing CRUD on a post they own" do
    before do
      @user = my_user
      sign_in @user
    end

    describe "POST #create" do
      it "increases the number of Item by 1" do
        expect { post :create, user_id: @user.id, item: { name: name } }.to change(Item, :count).by(1) # rubocop:disable HttpPositionalArguments, Metrics/LineLength
      end

      it "assigns the new item to @item" do
        post :create, user_id: @user.id, item: { name: name } # rubocop:disable HttpPositionalArguments
        expect(assigns(:item)).to eq Item.last
      end

      it "redirects to the user home page" do
        post :create, user_id: @user.id, item: { name: name } # rubocop:disable HttpPositionalArguments
        expect(response).to redirect_to root_path
      end
    end

    describe "DELETE destroy" do
      it "deletes the item" do
        delete :destroy, format: :js, user_id: @user.id, id: my_item.id
        count = Item.where(user_id: @user.id, id: my_item.id).count
        expect(count).to eq 0
      end

      it "returns http success" do
        delete :destroy, format: :js, user_id: @user.id, id: my_item.id
        expect(response).to have_http_status(:success)
      end
    end
  end
end
