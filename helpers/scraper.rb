require 'nokogiri'
require 'open-uri'

# Get a Nokogiri::HTML::Document for the page we’re interested in...
url = 'http://web.archive.org/web/20071025014638/http://grouphug.us/'
doc = Nokogiri::HTML(open(url)) 

texts = doc.css('td p')

ids = doc.css('h4 a')

0.upto(texts.length-1).each do |index|
  puts "#{ids[index].content}: #{texts[index].content.strip}"
end
