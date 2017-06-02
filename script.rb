require 'nokogiri'
require 'open-uri'

print 'Enter GitHub username: @'
username = gets.chomp

begin
  doc = Nokogiri::HTML(open("https://github.com/#{username}?tab=repositories"))
rescue OpenURI::HTTPError
  abort 'Sorry, no user with this username'
end

puts

doc.css('#user-repositories-list li h3 a').each do |link|
  repo = link.content.strip
  puts "#{repo} => https://github.com/#{username}/#{repo}.git"
end
