require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should redirect when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_author_session_path
  end

  test "should render the new page when logged in" do
    sign_in authors(:david)

    get :new
    assert_response :success
  end

  test "should be logged in to post a article" do
    post :create, status: { content: "Hello", title: "New Post" }
    assert_response :redirect
    assert_redirected_to new_author_session_path
  end

  test "should create article when logged in" do
    sign_in authors(:david)

    assert_difference('Article.count') do
      post :create, article: { content: @article.content, title: @article.title }
    end

    assert_redirected_to article_path(assigns(:article))
  end

  test "should create article for the current author when logged in" do
    sign_in authors(:david)

    assert_difference('Article.count') do
      post :create, article: { content: @article.content, title: @article.title, author_id: authors(:tony).id }
    end

    assert_redirected_to article_path(assigns(:article))
    assert_equal assigns(:article).author_id, authors(:david).id
  end

  test "should show article" do
    get :show, id: @article
    assert_response :success
  end

  test "should get edit when logged in" do
    sign_in authors(:david)

    get :edit, id: @article
    assert_response :success
  end

  test "should redirect article update when not logged in" do
    put :update, id: @article, article: { content: @article.content, title: @article.title }
    assert_response :redirect
    assert_redirected_to new_author_session_path
  end

  test "should destroy article when logged in" do
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article
    end

    assert_redirected_to articles_path
  end
end
