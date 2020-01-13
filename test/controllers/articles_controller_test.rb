require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get(v1_articles_url)

    assert_response(:success)

    response_json.map do |res|
      assert_equal(res, @article.as_json)
    end
  end

  test "should create article" do
    title       = 'this is title.'
    description = 'this is description.'

    assert_difference('Article.count') do
      article_params = {
        title:       title,
        description: description
      }
      post(
        v1_articles_url,
        params: article_params
      )
    end

    assert_response(:created)

    assert_equal(response_json['title'],       title)
    assert_equal(response_json['description'], description)
  end

  test "should show article" do
    get(v1_article_url(@article))

    assert_response(:success)

    assert_equal(response_json, @article.as_json)
  end

  test "should update article" do
    new_title       = 'this is new title.'
    new_description = 'this is new description.'

    put(
      v1_article_url(@article),
      params: { 
        title:       new_title,
        description: new_description
      }
    )

    assert_response(:success)

    assert_equal(response_json['title'],       new_title)
    assert_equal(response_json['description'], new_description)
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete(v1_article_url(@article))
    end

    assert_response :no_content
  end

  private

  def response_json
    @response_json ||= JSON.parse(response.body)
  end
end
