class PostsController < ApplicationController
  def index
    posts = Post.all
    render json: posts, status: :found
  end

  def show
    post = Post.find_by(id: params[:id])
    if post
      render json: {post: post}, status: :found
    else
      render json: {message: "Post not found"}, status: :not_found
    end
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: { message: "Created successfully", post: post}, status: :created
    else
      render json: { errors: "Post could not be created"}, status: :unprocessable_entity
    end
  end

  
  def destroy
    post = Post.find_by(id: params[:id]) 
    if post
      post.destroy
      render json: { message: "Post deleted successfully" }, status: :ok
    else
      render json: { error: "Post not found" }, status: :not_found
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
