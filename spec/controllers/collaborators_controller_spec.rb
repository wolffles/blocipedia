require 'rails_helper'

RSpec.describe CollaboratorsController, type: :controller do
  context "signed_in" do
    before(:each) do
      @my_user = FactoryGirl.create(:user)
      sign_in @my_user
      @my_wiki = FactoryGirl.create(:wiki, user: @my_user)
      @collab_user = FactoryGirl.create(:user, email: "collab@gmail.com")
      sign_in @collab_user
      @my_collaborator = Collaborator.create(user_id: @collab_user.id, wiki_id: 2)
    end

    describe "POST create" do
      it "increases the number of Collaborators by 1 and redirects after save" do
        expect{ post :create, params:{ collaborator: {id: @my_user.email, wiki_id: @my_wiki.id}}}.to change(Collaborator, :count).by(1)
        expect(response).to redirect_to edit_wiki_path(@my_wiki.id)
      end
    end

    describe "DESTROY delete" do
      it "removes the collaborator from Wiki" do
        # this is not working, I wrote the test to match the method (and the expected) params. Please double check
        # the destroy method should be matching on user_id and wiki_id
        delete :destroy, params: { emails: @collab_user.email }
        count = Wiki.where({id: @my_wiki.id}).size
      end
    end
  end
end
