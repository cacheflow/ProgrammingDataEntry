require "mechanize"
require "nokogiri"
require "open-uri"
require "csv"
agent = Mechanize.new 

page = agent.get("http://elclasificado.com/losangeles")

sub_links = page.links_with(:class => "tile-more-link")
word_file = File.open("words.txt", "w+")
words = []
sub_links.each do |sub| 
	parse_with_noko = Nokogiri::HTML(open(sub.href))

	columns =  ["Title", "Total Ads", "Total Vists", "Total Page Views", "Total Impressions", "CPC", "RPM", "Revenue"]
	CSV.open("ads.csv", "a+", :write_headers => true, :headers => columns,
	:header_converters => :symbol) do |csv| 
	parse_with_noko.css(".subcategory-item-link").each do |main| 
		columns = nil
		# word_file << [main.text.downcase.tr("[()]+0-9", ""), main.text.tr("^0-9$", "")].collect(&:strip)  
			words << [main.text.downcase.tr("[()]+0-9", "")].collect(&:strip)
		end 
	end 	
end
contents = CSV.open("ads.csv", :headers => true, :header_converters => :symbol)



words.each do |word| 


contents.each do |row| 
	if row[:title].include?("#{word}")
		puts row	
	end 
end
end 
