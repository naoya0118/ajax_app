class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC")
  end
  def create
    Post.create(content: params[:content])
    redirect_to action: :index
  end
  def checked
    # binding.pry
    post = Post.find(params[:id])
    if post.checked # (もし１だったらfalseにしてね、そうではなくて０だったらtrueにしてね)
      post.update(checked: false)  # false = 0
    else
      post.update(checked: true)  #true = 1
    end
    item = Post.find(params[:id])
    render json: { post: item }
  end

end