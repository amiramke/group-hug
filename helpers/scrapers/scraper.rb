require 'nokogiri'
require 'open-uri'

class Scrape
  attr_reader :doc
  def initialize(url)
    @doc = Nokogiri::HTML(open(url)) 
  end

  def css(sym)
   # @doc.{:css => "css"}[search_type](search_term)
    @doc.css( { confessions: 'td p', ids: 'h4 a' }[sym]).map { |item| item.content.strip }
  end
end

# Get a Nokogiri::HTML::Document for the page we’re interested in...
#url = 'http://web.archive.org/web/20071025014638/http://grouphug.us/'
#doc = Nokogiri::HTML(open(url)) 

#texts = doc.css('td p')

#ids = doc.css('h4 a')


#0.upto(texts.length-1).each do |index|
#  puts "#{ids[index].content}: #{texts[index].content.strip}"
#end
