class LandingController < ApplicationController
  # [GET] "/"
  def index
    @articles = Article.all
  end
end
