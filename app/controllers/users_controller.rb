class UsersController < ApplicationController
  def new
  end

  def create
    username = params['username']
    auth = session[:auth]

    user = User.create_with_oauth auth['info']
    identity = Identity.create_with_oauth auth

    user.name = username
    if user.save
      self.current_user = user
      identity.user = user
      identity.save
    else
      respond_to do |format|
        format.json status: 500
      end
    end
  end
end
