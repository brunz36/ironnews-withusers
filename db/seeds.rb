require 'open-uri'
require 'nokogiri'

user_1 = User.create(name: "Patrick Miller", email: "pjmiller823@gmail.com", password: "password", password_confirmation: "password")
user_2 = User.create(name: "Bruno", email: "brunz36@gmail.com", password: "password", password_confirmation: "password")

(1..10).each do |page|
  Nokogiri::HTML(open("https://news.ycombinator.com?p=#{page}")).css(".storylink").each_with_index { |article, index| Story.create(title: article.content, url_link: article.values.first, email: index.odd? ? 'pjmiller823@gmail.com' : 'brunz36@gmail.com', created_by: index.odd? ? user_1 : user_2) }
end
