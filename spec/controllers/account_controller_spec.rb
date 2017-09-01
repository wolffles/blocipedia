require 'rails_helper'

RSpec.describe AccountController, type: :controller do
  before(:each) do
    @my_user = FactoryGirl.create(:user)
    @my_user.update_attribute(:role, :premium)
    sign_in @my_user
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
describe "GET downgrade" do
  it "returns http success" do
    get :downgrade
    expect(response).to have_http_status(:success)
  end

  it "changes a premium user to standard" do
    post :downgrading, params: {current_user: @my_user}
    expect(@my_user.role).to eq "standard"
  end
end
end
