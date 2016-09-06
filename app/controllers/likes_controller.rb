class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    idea = Idea.find params[:idea_id]
    like = Like.new user: current_user, idea: idea
    if like.save
      redirect_to root_path, notice: "Thanks for liking!"
    else
      redirect_to root_path, alert: like.errors.full_messages.join(", ")
    end
  end

  def destroy
    idea = Idea.find params[:idea_id]
    like = Like.find params[:id]
    like.destroy
    redirect_to question_path(question), notice: "Unliked!"
  end
end
