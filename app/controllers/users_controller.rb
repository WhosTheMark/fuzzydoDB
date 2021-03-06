class UsersController < ApplicationController

  include ProfileHelper

  before_action :set_user_by_id, only: [:update, :destroy, :transfer_role]
  before_action :set_user_by_username, only: [:show, :edit, :edit_profile_photo, :update_password]
  protect_from_forgery except: [:validate_username, :validate_email]
  before_filter :admin_or_super_member_only!, only: [:index, :destroy, :transfer_role, :show_transfer_role]
  before_filter :super_member_only!, only: [:change_roles]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /profile/1
  # GET /profile/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /profile/1/edit
  def edit
    current_user_only! @user
  end

  # GET /profile/1/editPhoto
  def edit_profile_photo
    current_user_only! @user
  end

  def update_password
    updated = @user.update_with_password(user_params)
    flash.clear
    if updated
      flash[:success] = t("user-profile.edit-password.success")
      sign_in @user, :bypass => true
    elsif !updated
      flash[:danger] = t("user-profile.edit-password.wrong-old-password")
    end
    render "edit_password"
  end

  def edit_password
    @user = current_user
  end

  # PATCH/PUT /profile/1
  # PATCH/PUT /profile/1.json
  def update
    respond_to do |format|
      current_user_only! @user
      if @user.update(user_params)
        format.html { redirect_to profile_path(@user.username)}
        format.json { render :show, status: :ok, location: profile_path(@user.username)}
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile/update_avatar
  # PATCH/PUT /profile/update_avatar.json
  def update_avatar

    @user = current_user
    @user.avatar = params[:file]

    @user.save!

    respond_to do |format|
      format.html { redirect_to profile_path(@current_user.username) }
      format.json { render :show, status: :ok }
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  # Admins and super_members cannot be destroyed
  def destroy

    unless @user.admin_or_super_member?
      @user.destroy
      flash[:delete_notice] = @user.username
    end

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  # DELETE /profile/destroy_avatar
  def destroy_avatar
    @user = current_user
    @user.remove_avatar!
    @user.save!
    User.where(username: @user.username).update(avatar: nil)

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  # If the user doesn't exists, then it is valid
  def validate_username
    username = params[:username]
    user_exists = !User.exists_username?(username)
    respond_to do |format|
      format.json { render json: user_exists }
    end
  end

  def validate_email
    if !current_user.nil? && current_user.email.eql?(params[:email])
      user_exists = true
    else
      email = params[:email]
      user_exists = !User.exists_email?(email)
    end

    respond_to do |format|
      format.json { render json: user_exists }
    end
  end

  #PATCH/PUT
  def change_roles
    changed_users = params[:users]
    User.change_roles(changed_users)

    respond_to do |format|

      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  # GET
  def show_transfer_role
    if current_user.super_member?
      @users = User.where(role_cd: User.roles[:member])
    else
      @users = User.where(role_cd: User.roles[:user])
    end
  end

  #POST
  # current user transfer his role
  # super member can only transfer his role to member
  # admin to users
  def transfer_role

    if !@user.admin_or_super_member?
      @user.role = current_user.role

      if current_user.super_member?
        current_user.member!
      else
        current_user.user!
      end

      @user.save!
      current_user.save!
    end

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_by_username
      @user = User.find_by_username(params[:username])
      if @user.nil?
        raise Mongoid::Errors::DocumentNotFound.new(User, :username => params[:username])
      end
    end

    def set_user_by_id
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :name, :email, :occupation, :institution, :country, :password, :password_confirmation, :current_password)
    end
end
