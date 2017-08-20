require 'random_data'
require 'rails_helper'



RSpec.describe WikisController, type: :controller do
  before(:each) do
    @my_user = FactoryGirl.create(:user)
    sign_in @my_user
    @my_wiki = FactoryGirl.create(:wiki, user: @my_user)
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "Get new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @wiki" do
      get :new
      expect(assigns(:wiki_page)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Wiki by 1" do
    expect{post :create, wiki_page: {title: RandomData.random_sentence, body: RandomData.random_paragraph, user: @my_user}}.to change(Wiki,:count).by(1)
  end

  it "assigns the new wiki to @wiki" do
    post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, user: @my_user}
    expect(assigns(:wiki_page)).to eq Wiki.last
  end

  it "redirects to the new wiki" do
    post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, user: @my_user}
    expect(response).to redirect_to Wiki.last
  end
  end
end
