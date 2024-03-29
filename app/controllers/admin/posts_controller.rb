class Admin::PostsController < Admin::AdminController
  before_filter :load_resources, only: %w(new create edit update)
  menu_item :posts

  def index
    @posts = Post.order("created_at desc").paginate(page: params[:page])
    respond_with @posts
  end

  def show
    @post = Post.find(params[:id])
    render layout: "application"
  end

  def new
    @post = Post.new
    respond_with @post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])

    flash[:notice] = 'Post was successfully created.' if @post.save
    respond_with @post, location: admin_posts_path
  end

  def update
    @post = Post.find(params[:id])
    flash[:notice] = 'Post was successfully updated.' if @post.update_attributes(params[:post])
    respond_with @post, location: edit_admin_post_path(@post)
  end

  def assets
    @assets = Asset.order("created_at DESC").paginate(page: params[:page], per_page: 3)

    render layout: false
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_with @post, location: admin_posts_path
  end

protected

  def load_resources
    @authors = User.all
    @categories = PostCategory.all
    @assets = Asset.order("created_at DESC").paginate(page: params[:page], per_page: 3)
  end

end
