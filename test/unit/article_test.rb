require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "that an article requires content" do
  	article = Article.new
  	assert !article.save
  	assert !article.errors[:content].empty?
  end

  test "that an article's content is at least 2 letters" do
  	article = Article.new
  	article.content = "H"
  	assert !article.save
  	assert !article.errors[:content].empty?
  end

  test "that an article requires a title" do
  	article = Article.new
  	assert !article.save
  	assert !article.errors[:title].empty?
  end

  test "that an article's title is at least 2 letters" do
  	article = Article.new
  	article.title = "H"
  	assert !article.save
  	assert !article.errors[:title].empty?
  end

  test "that an article has an author id" do
  	article = Article.new
  	article.content = "Hello"
  	assert !article.save
  	assert !article.errors[:author_id].empty?

  end
end
