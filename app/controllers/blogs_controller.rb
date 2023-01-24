class BlogsController < ApplicationController
  def index    
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to blogs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def blog_params
      params.require(:blog).permit(:name, :description)
    end
end