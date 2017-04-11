class Story < ApplicationRecord
  validates :email, presence: true
  validates :url_link, format: { with: /\A(https|http)/ }
  has_many :comments

  belongs_to :created_by, class_name: "User"
end
