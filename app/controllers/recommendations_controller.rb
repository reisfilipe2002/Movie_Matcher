class RecommendationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def index
    @recommendations = Recommendation.where(user_id: current_user.id)
  end

  def show
    @recommendation = Recommendation.find_by(id: params[:id])

    if @recommendation.nil?
      # Redirecionar para uma página de erro, como a página inicial ou uma página específica de erro
      redirect_to root_path, alert: "A recomendação não foi encontrada."
    else
      render 'recommendations/show'
    end
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.new(title: params[:title])
    @recommendation.user = current_user
    if @recommendation.save
      redirect_to @recommendation, notice: 'Recommendation was successfully created.'
    else
      render :new
    end
  end

  # private

  # def recommendation_params
  #   params.require(:recommendation).permit(:title)
  # end
end
