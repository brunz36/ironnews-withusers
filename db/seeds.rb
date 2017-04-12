require 'open-uri'
require 'nokogiri'

user_1 = User.create(name: "Patrick Miller", email: "pjmiller823@gmail.com", password: "password", password_confirmation: "password")
user_2 = User.create(name: "Bruno Ribeiro", email: "brunz36@gmail.com", password: "password", password_confirmation: "password")
user_3 = User.create(name: "Thais Ribeiro", email: "thais@gmail.com", password: "test", password_confirmation: "test")

(1..10).each do |page|
  Nokogiri::HTML(open("https://news.ycombinator.com?p=#{page}")).css(".storylink").each_with_index { |article, index| Story.create(title: article.content, url_link: article.values.first, email: index.cycle? ? 'pjmiller823@gmail.com' : 'brunz36@gmail.com' : 'thais@gmail.com', created_by: index.cycle? ? user_1 : user_2 : user_3) }
end
