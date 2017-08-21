require 'rails_helper'

RSpec.describe Wiki, type: :model do
let(:my_user) { User.create!(email: "example@blocipedia.com", password:"password") }
  let(:my_wiki) { Wiki.create!(title: "title", body: "MyTextBody", user: my_user) }

  describe "attributes" do
    it "has title and body" do
      expect(my_wiki).to have_attributes(title: "title", body: "MyTextBody")
    end
  end
end
