class Article < ActiveRecord::Base
  attr_accessible :content, :title, :author_id, :category_id
  belongs_to :author
  belongs_to :category

  validates :title,		presence: true,
						length: { minimum: 2 }
  validates :content,	presence: true,
  						length: { minimum: 2 }

  validates :author_id, presence: true
end