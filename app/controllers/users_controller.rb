class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :transfer_role]
  protect_from_forgery except: [:validate_username, :validate_email]
  before_filter :admin_or_super_member_only!, only: [:index, :destroy, :transfer_role, :show_transfer_role]
  before_filter :super_member_only!, only: [:change_roles]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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

  # If the user doesn't exists, then it is valid
  def validate_username
    username = params[:username]
    user_exists = !User.exists_username?(username)
    respond_to do |format|
      format.json { render json: user_exists }
    end
  end

  def validate_email
    email = params[:email]
    user_exists = !User.exists_email?(email)
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
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :name, :email)
    end
end
