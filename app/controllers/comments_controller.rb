class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @comment = @post.comments.build(params[:comment])
    @comment.save
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end
  def update_attributes
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to post_path(@post)
    else
      render :action => :edit
    end

    def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to post_path(:id => @post.id)
    end
end
