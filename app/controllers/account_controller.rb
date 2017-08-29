class AccountController < ApplicationController
  def index
  end

  def downgrade
  end

  def downgrading
      current_user.role = "standard"
  end
end
