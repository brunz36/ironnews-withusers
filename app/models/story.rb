class Story < ApplicationRecord
  validates :email, presence: true
  validates :url_link, format: { with: /\A(https|http)/ }
end
