class AccountController < ApplicationController
  def index
  end

  def downgrade
  end

  def downgrading
    #current_user.role = "standard"
    #current_user.save!

    current_user.update_attribute(:role, "standard")
    redirect_to account_path
  end
end
