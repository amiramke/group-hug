require_relative 'spec_helper'

describe "scraper" do
  
  context "initialize" do
    
    it "Scrapes the webpage" do
      scraper = Scrape.new('http://web.archive.org/web/20071025014638/http://grouphug.us/')
      scraper.doc.content.should_not be_empty #class.should be_an_instance_of(Nokogiri::HTML::Document)
    end
    
    it "returns confession text array" do
      scraper = Scrape.new('http://web.archive.org/web/20071025014638/http://grouphug.us/')
      scraper.css('td p').length.should have_at_least(2).items
    end
   
    it "returns confession ids array" do
      scraper = Scrape.new('http://web.archive.org/web/20071025014638/http://grouphug.us/')
      scraper.css('h4 a').length.should have_at_least(2).items
    end

  end
end
