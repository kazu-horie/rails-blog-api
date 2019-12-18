module V1
  class ArticlesController < ApplicationController
    def index
      @articles = Article.all

      render json: @articles
    end

    def show
      @article = Article.find(params[:id])

      render json: @article
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)

      if @article.save
        render status: :created, json: @article
      else
        render status: :unprocessable_entity
      end
    end

    def edit
      @article = Article.find(params[:id])

      render json: @article
    end

    def update
      @article = Article.find(params[:id])

      if @article.update(article_params)
        render json: @article
      else
        render status: :unprocessable_entity
      end
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy

      render status: :no_content
    end

    private

    def article_params
      params.require(:article).permit(:title, :description)
    end
  end
end
