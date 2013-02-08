class PostsController < ApplicationController
  # GET /posts/all
  # GET /posts/all.json
  def index_all
    @posts = Post.all    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/bydate
  # GET /posts/bydate.json
  def sorted_by_creation
    @posts = Post.all    
    @posts.sort! { |a,b| b.created_at <=> a.created_at }
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end



  # GET /posts
  # GET /posts.json
  def index
     sorted_by_creation
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
#    @post.update_attributes({:state => 'pending'})
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes({:state => 'deleted'})
        format.html { redirect_to @post, notice: 'Post was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @post, notice: 'Error deleting post. Please, try again letter.' }
        format.json { head :no_content }
      end
    end
  end
end
