class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_with(@users)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    respond_with(@user)
  end

  # GET /users/new
  def new
    @user = User.new
    respond_with(@user)
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

      if @user.save
        cookies.permanent[:last_user_id] = @user.id
        flash[:notice] =  'User was successfully created.' 
      end
      respond_with(@user)
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      if @user.update(user_params)
        flash[:notice] = 'User was successfully updated.' 
      end
      respond_with(@user)
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy   
    flash[:notice] = 'User was successfully destroyed.' 
    respond_with(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :position, :hiring_date, :birth_date)
    end
end
