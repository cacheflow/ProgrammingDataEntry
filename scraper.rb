require "mechanize"
require "nokogiri"
require "open-uri"
require "csv"
agent = Mechanize.new 

page = agent.get("http://elclasificado.com/losangeles")

sub_links = page.links_with(:class => "tile-more-link")
word_file = File.open("words.txt", "w+")
sub_links.each do |sub| 
	parse_with_noko = Nokogiri::HTML(open(sub.href))

	columns =  ["Title", "Total Ads", "Total Vists", "Total Page Views", "Total Impressions", "CPC", "RPM", "Revenue"]
	CSV.open("ads.csv", "a+", :write_headers => true, :headers => columns,
	:header_converters => :symbol) do |csv| 
	parse_with_noko.css(".subcategory-item-link").each do |main| 
		columns = nil
		# word_file << [main.text.downcase.tr("[()]+0-9", ""), main.text.tr("^0-9$", "")].collect(&:strip)  
			word_file << [main.text.downcase.tr("[()]+0-9", "")].collect(&:strip)
		end 
	end 	

	# CSV.open("ads.csv", "w+", :write_headers => true, :headers => ["Title", "Total Ads", "Total Vists", "Total Page Views", "Total Impressions", "CPC", "RPM", "Revenue"],
	# :header_converters => :symbol) do |csv| 
	# parse_with_noko.css(".subcategory-item-link").each do |main|
	# 	csv <<  [main.text.tr("[()]+0-9", ""), main.text.tr("^0-9$", "")].
	# 	collect(&:strip) 
	# end 

# 	CSV.open("ads.csv", "w+", :write_headers => true, :headers => ["Title", "Total Ads", "Total Vists", "Total Page Views", "Total Impressions", "CPC", "RPM", "Revenue"],
# 	:header_converters => :symbol) do |csv| 
# 	sub_links.each do |main| 
# 		csv << [main.text.tr("[()]+0-9", ""), main.text.tr("^0-9$", "")].collect(&:strip)
# 	end 
# 	end	 
# end 
# 	# parse_links = Nokogiri::HTML((open(main.href)))
	# parse_links.css(".subcategory-item-link").each do |ad|
	# csv[:title] <<  [ad.text.tr("[()]+0-9", "")].collect(&:strip)
	# csv[:body] << [ad.text.tr("^0-9$", "")].collect(&:strip)
	# end	
	# end 
end 

# test_ads = CSV.open("testAds.csv", "r", :headers => true)
# 	try_ads.each do |ads| 
# 		puts ads[1]
# 	end 
# scraped_ads = CSV.open("ads.csv", "r", :headers => true)

# 	scraped_ads.each do |scraped| 


# contents = CSV.open("ads.csv", "r+", :headers => true) 

# contents.each do |row| 
# 	puts row[3]
# end 
# ads = CSV.open("testAds.csv", :headers => true) 
# categoryAds = CSV.open("categoryAds.csv", "r")
# new_words = CSV.open('resultingWords.csv', "a+") do |word| 
# 	categoryAds.each do |category|
			
# 	end 

# ads.each do |content| 
# categoryAds.each do |category| 	
# 	subcategory = content[1]
# 	if category == subcategory
# 		word << category
# 	end 
# end 
# end


 