class CommentsController < ApplicationController

  def index
    @article = Article.find(params[:article_id])
    @comments = @article.comments
    render :json => @comments.to_json
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params[:comment])
    render :json => { :valid => @comment.valid? }.to_json
  end
  
end
