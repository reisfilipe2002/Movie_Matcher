class RecommendationsController < ApplicationController
  def index
    @recommendations = Recommendation.where(user_id: current_user.id)
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    if @recommendation.save
      redirect_to @recommendation, notice: 'Recommendation was successfully created.'
    else
      render :new
    end
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:title, :description, :user_reference)
  end
end
