class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :home]

  def index
  end

  def home
  end
end
