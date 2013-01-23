class SessionController < ApplicationController
  before_filter :user_signed_in?, :only => [:delete]

  def create
    if user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][password])
      redirect_to root_path
    else
      render :new, :flash => {error: "bad email/password combination"}
    end
  end

  def delete
    session.delete(:user_id)
  end
end
