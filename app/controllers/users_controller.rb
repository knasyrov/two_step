class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.assign_attributes(user_params)

    if @user.next_step
      redirect_to edit_user_path(@user)
    else
      render :new
    end
  end

  def update
    @user.assign_attributes(user_params)

    respond_to do |format|
      if @user.next_step && @user.completed?
        format.html { redirect_to user_path(@user) }
        format.json { render json: { url: user_path(@user) } }
      else
        Rails.logger.info @user.errors.inspect
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def load_user
    @user = User.find(params[:id]).decorate
  end

  def user_params
    params.require(:user).permit(@user.form_fields)
  end
end
