class AccountController < ApplicationController
  before_action :standard?, only: [:downgrading]

  def index
  end

  def downgrade
  end

  def downgrading
    #current_user.role = "standard"
    #current_user.save!
    flash[:notice] = "All of #{current_user.email}'s wikiz has been changed to public wikiz for public viewing pleasure oOOooh!"
    current_user.update_attribute(:role, :standard)
    #when downgrading all users wikis turn publick
    current_user.wikis.each { |wiki|
      wiki.update_attribute(:private, false)
    }
    redirect_to account_path
  end
  private

    def standard?
      if current_user.role == "standard"
        flash[:notice] = "Hey there buddy, I mean no offense, but you're already the lowest of the low, cant downgrade any further."
        redirect_to account_path
      end
    end
end
