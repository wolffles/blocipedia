require 'rails_helper'

RSpec.describe CollaboratorsController, type: :controller do
  context "signed_in" do
    before(:each) do
      @my_user = FactoryGirl.create(:user)
      sign_in @my_user
      @my_wiki = FactoryGirl.create(:wiki, user: @my_user)
    end

    describe "POST create" do
      it "increases the number of Collaborators by 1" do
        expect{ post :create, params:{ collaborator: {id: "wolfie.truong@gmail.com", wiki_id: 4, user_id: 1 }}}.to change(Collaborator, :count).by(1)
      end

      it "redirects after save" do
        post :create, params:{ collaborator: { wiki_id: @my_wiki.id, user_id: @my_user.id }}
        expect(response).to redirect_to edit_wiki_path(4)
      end
    end

    describe "DESTROY delete" do
      it "removes the collaborator from Wiki" do
        delete :destroy, params: { id: 3 }
        count = Wiki.where({id: @my_wiki.id}).size
      end
    end
  end
end
