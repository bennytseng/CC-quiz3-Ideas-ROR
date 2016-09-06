class UsersController < ApplicationController


  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    user = User.new(user_params)

      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/users/new'
      end
    end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
