class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
  end
 
  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    new_password = params[:user][:password]
    if !new_password.empty? && @user.update_attributes(:password => new_password)
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      # render :action => :edit
      redirect_back_or_default account_url
    end
  end
end