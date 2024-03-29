require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: authors(:david).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profile not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "that variable are assigned on successful profile viewing" do
  	get :show, id: authors(:david).profile_name
  	assert assigns(:author)
  	assert_not_empty assigns(:articles)
  end

  test "only show the correct articles" do
    get :show, id: authors(:david).profile_name
    assigns(:articles).each do |article|
      assert_equal authors(:david), article.author
    end
  end
end
