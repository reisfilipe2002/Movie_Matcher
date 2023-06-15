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
    if current_user.watchlist.recommendations.include?(Recommendation.find_by(title: params[:title]))
      redirect_to watchlists_path, flash: { alert: "Filme já está na sua lista!" }
    else
      @recommendation = Recommendation.new(title: params[:title])
      @recommendation.user = current_user
      if @recommendation.save
        redirect_to watchlists_path, flash: { notice: "Recomendação criada com sucesso!" }
      else
        render :new, status: :unprocessable_entity
      end
    end
  end
end
