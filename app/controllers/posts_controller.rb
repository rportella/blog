class PostsController < ApplicationController
 before_filter :load_categories
  def index
    @posts = Post.scoped
    @posts = Post.search(params[:search]) if params[:search].present?
    @posts = @category.posts if @category.present?
    @posts = @posts.published
    respond_with @posts
  end

  def show
    @post = Post.published.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end
private
  def load_categories
    @categories = PostCategory.all
    @category = PostCategory.find(params[:category_id]) if params[:category_id]
  end

end
