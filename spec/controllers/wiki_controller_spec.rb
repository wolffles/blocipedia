require 'random_data'
require 'rails_helper'



RSpec.describe WikisController, type: :controller do
 context "not signed in" do
    describe "Post create" do
      it "failed to post" do
        post :create, params: {wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
  context "signed_in" do
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
        expect{post :create, params: { wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, user: @my_user}}}.to change(Wiki,:count).by(1)
      end

    #in rails 5 you have to wrap parameters in params
      it "assigns the new wiki to @wiki" do
        post :create, params: {wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, user: @my_user}}
        expect(assigns(:wiki_page)).to eq Wiki.first
      end

      it "redirects to the new wiki" do
        post :create, params: {wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, user: @my_user}}
        expect(response).to redirect_to Wiki.first
      end

=begin      it "failed to post" do
        post :create, params: {wiki: {title: "", body:""}}
        expect(response).to redirect_to new_wiki_path
      end
=end
    end

    describe "GET edit" do
      it "returns http redirect" do
        get :edit, params: {id: @my_wiki.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, params: {id: @my_wiki.id}
        expect(response).to render_template :edit
      end


      it "assigns topic to be updated to @wiki" do
        get :edit, params: {id: @my_wiki.id}
        wiki_instance = assigns(:wiki_page)

        expect(wiki_instance.id).to eq @my_wiki.id
        expect(wiki_instance.title).to eq @my_wiki.title
        expect(wiki_instance.body).to eq @my_wiki.body
      end
    end

    describe "PUT update" do
      it "updates wiki with expected attributes" do
        new_title = RandomData.random_sentence
        new_body = RandomData.random_paragraph

        put :update, params: {id: @my_wiki.id, wiki: {title: new_title, body: new_body}}

        updated_wiki = assigns(:wiki_page)
        expect(updated_wiki.id).to eq @my_wiki.id
        expect(updated_wiki.title).to eq new_title
        expect(updated_wiki.body).to eq new_body
      end
    end

    describe "GET show" do
      it "shows the wiki" do
        get :show, params: {id: @my_wiki.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, params: {id: @my_wiki.id}
        expect(response).to render_template :show
      end

      it "assigns @my_wiki to :wiki_page" do
        get :show, params: {id: @my_wiki.id}
        expect(assigns(:wiki_page)).to eq(@my_wiki)
      end
    end

    describe "DELETE destroy" do
      it "deletes the wiki" do
        delete :destroy, params: { id: @my_wiki.id}
        count = Wiki.where({id: @my_wiki.id}).size
        expect(count).to eq 0
      end
      it "redirects to the wikilist page" do
        delete :destroy, params: {id: @my_wiki.id}
        expect(response).to redirect_to wikis_path
      end
    end
  end
end
