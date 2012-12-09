class UsersController < ApplicationController
  #new (before statement) - working
   before_filter :signed_in_user, only: [:edit, :update]
  #new (before statement)
   before_filter :correct_user,   only: [:edit, :update]
  #end (before statement)

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end
    def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
end

#new (def edit_update) - working
  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
#end new (def edit_update) - working

  #def edit
    #@user = User.find(params[:id])
  #end
#new - working
    #def update
    #@user = User.find(params[:id])
   # if @user.update_attributes(params[:user])
      #new (flash) - working
      #flash[:success] = "Profile updated"
      #sign_in @user
      #redirect_to @user
      #end new (flash) - working
   # else
     # render 'edit'
    #end
  #end
#end new - working
end
#new (signed_in_user) - working
 private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
    #new (unless_signed_in) - working
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    #end (unless_signed_in) - working

#end new (signed_in_user) - working

  