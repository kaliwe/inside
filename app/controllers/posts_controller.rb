class PostsController < ApplicationController
  def new
  end

  def create
    title = params[:title]
    body = params[:body]
    post = Post.new(title: title, body: body)
    post.user = current_user

    if post.valid?
      post.save
      redirect_to root_url
    else
      errors = post.errors.messages.map { |k, v| "#{k}: #{v.join ', '}" }
      respond_to do |format|
        format.json { render json: errors, status: 400 }
      end
    end
  end
end
