require "csv"
# CSV.foreach("analytics.csv", headers: true) do |csv| 
# 	# CSV.open("CopyOfAnalytics.csv", "w+") do |copy| 
# 	# 	copy << csv

# 	# end 
# 	puts csv
# end 

second = CSV.foreach("copyingCsv.csv", headers: true, :header_converters => :symbol)

second.each do |csv| 
	data = {}
	data[:site] = csv.fields([:page]).to_s.tr('[]+""', "")	
	data[:pageviews] = csv.fields([:pageviews]).to_s.tr('[]+""', '')
	data[:uniques] = csv.fields([:uniques]).to_s.tr('[]+""', '')


	puts data.class
	# hash[:site] = csv.fields([:page])
	# hash[:views] = csv.fields([:pageviews]).to_s
	# hash[:unique] = csv.fields([:uniques]).to_s
	# hash[:totalads] = nil

end 
