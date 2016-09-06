class IdeasController < ApplicationController
  before_action :authorize, only: [:destroy, :update, :edit]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user = current_user
    if @idea.save
      flash[:notice] = "Question created successfully"
      redirect_to root_path
    else
      render :new
    end
  end


  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :body, :user)
    end
end
