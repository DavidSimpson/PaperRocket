class Category < ActiveRecord::Base
  attr_accessible :description, :name, :category_id

  has_many :articles
end