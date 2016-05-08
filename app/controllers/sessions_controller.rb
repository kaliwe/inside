class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    @identity = Identity.find_by_oauth(auth)

    if @identity.nil?
      @identity = Identity.create_with_oauth(auth)
    end

    if signed_in?
      if @identity.user == current_user
        redirect_to root_url, notice: "Already linked that account!"
      else
        @identity.user = current_user
        @identity.save
        redirect_to root_url, notice: "Succesfully linked that account!"
      end
    else
      if @identity.user.present?
        self.current_user = @identity.user
        redirect_to root_url, notice: "Signed in!"
      else
        user = User.find_by email: auth['info']['email']
        if user.nil?
          session[:auth] = auth
          redirect_to users_new_url
        else
          @identity.user = user
          @identity.save
          self.current_user = user
          redirect_to root_url
        end
      end
    end
  end

  def destroy
    self.current_user = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
