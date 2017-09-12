class Collaborator < ApplicationRecord
  has_many :user
  belongs_to :wiki

  def self.import(emails_string, wiki_id)
     @array_emails = emails_string.split
     @invalid, @valid = [], []
     @array_emails.each do |email|
       collaborator_id = User.where(email: email.downcase).pluck(:id)
       if collaborator_id.empty?
         @invalid << email
       else
         Collaborator.create(user_id: collaborator_id[0], wiki_id: wiki_id)
         @valid << email
       end
     end
     return @invalid, @valid
  end
end
