module V1
  class ArticlesController < ApplicationController
    def index
      @articles = Article.all

      render(json: @articles) unless fresh_when(etag: @articles)
    end

    def show
      @article = Article.find(params[:id])

      render(json: @article) unless fresh_when(etag: @article)
    end

    def create
      @article = Article.new(article_params)

      if @article.save
        render(status: :created, json: @article)
      else
        head(:unprocessable_entity)
      end
    end

    def update
      @article = Article.find(params[:id])

      if @article.update(article_params)
        render(json: @article)
      else
        head(:unprocessable_entity)
      end
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy

      head(:no_content)
    end

    private

    def article_params
      params.permit(:title, :description)
    end
  end
end
