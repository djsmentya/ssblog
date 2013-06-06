class Admin::UsersController < ApplicationController

  load_and_authorize_resource
  # GET /posts
  # GET /posts.json
  def index
    @users = User.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end


  def edit
    @user = User.find(params[:id])
    @roles = Role.all
  end

  def create
    @user = User.new(params[:post])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Post was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    @user.roles.clear
    role =  Role.find(params[:user][:roles])
    @user.roles.push role
    params[:user].delete :roles
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admin_users_path, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end
end
