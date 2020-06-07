class VotesController < ApplicationController
  before_action :signed_in_only!

  def create
    @article = Article.find(params[:article_id])
    @article.votes.create(user: current_user)
    redirect_to @article, notice: 'Thanks for your vote.'
  end

  def destroy
    vote = Vote.find(params[:id])
    vote.destroy
    @article = Article.find(params[:article_id])
    redirect_to @article, notice: 'Sorry'
  end
end
