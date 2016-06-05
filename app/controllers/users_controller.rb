class UsersController < ApplicationController

  include ProfileHelper

  before_action :set_user_by_id, only: [:update, :destroy]
  before_action :set_user_by_username, only: [:show, :edit, :edit_profile_photo]
  protect_from_forgery except: [:validate_username, :validate_email]
  before_filter :admin_only!, only: [:index]

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
    @user = User.find_by_username(params[:username])
    current_user_only! @user
  end

  def edit_profile_photo
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
      current_user_only! @user
      if @user.update(user_params)
        format.html { redirect_to profile_path(@user.username), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: profile_path(@user.username)}
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
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
    if current_user.email.eql? params[:email]
      user_exists = true
    else
      email = params[:email]
      user_exists = !User.exists_email?(email)
    end

    respond_to do |format|
      format.json { render json: user_exists }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_by_username
      @user = User.find_by_username(params[:username])
    end

    def set_user_by_id
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :name, :email, :occupation, :institution, :country)
    end
end
