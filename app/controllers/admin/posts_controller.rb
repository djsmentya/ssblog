class Admin::PostsController < ApplicationController


  load_and_authorize_resource
  before_filter :authenticate_user!
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

end
