require_relative '../app/models/user'
require_relative '../app/models/confession'
require_relative '../helpers/scrapers'

module GroupHugImporter
  def self.import(url = 'http://web.archive.org/web/20071025014638/http://grouphug.us/')
    scraper = Scrape.new(url)
    data = scraper.css(:ids).zip scraper.css(:confessions)
   
    ActiveRecord::Base.transaction do
      data.each do |(id_number, confession)|
        user = User.create!({ id_number: id_number, site_version: "1.0" })
        confession = Confession.new({ content: confession})
        confession.user = user
        confession.save!
      end
    end
#    User.transaction do 
#      id_numbers.each do |id_number|
#        user = User.create({ id_number: id_number, site_version: "1.0" })
#      end
#    end
#
#    User.transaction do 
#      confessions.each_with_index do |confession, index|
#        confession = Confession.create!({ content: confession, user_id: poster_ids })
#      end
#    end

  end
end

#begin
#  GroupHugImporter.import
#rescue ArgumentError => e
#  $stderr.puts "Usage: ruby group_hug_importer.rb"
#rescue NotImplementedError => e
#  $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
#end
