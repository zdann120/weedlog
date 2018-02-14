class Admin::UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @users = User.all
    authorize [:admin, @users]
  end

  def show
  end

  def new
    redirect_to new_user_invitation_url
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to [:admin, @user], notice: 'User updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy!
      redirect_to admin_users_url, notice: 'User destroyed.'
    end
  end

  private

  def set_user
    @user = User.find params[:id]
    authorize [:admin, @user]
  end

  def authenticate_admin!
    authenticate_user!
    raise StandardError unless current_user.admin?
  end
end
