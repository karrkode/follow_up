class Upload < ApplicationRecord
	require 'csv'
	belongs_to :uploader, class_name: 'User'
	belongs_to :organization

	def self.generateTerf(upload,affiliate_id,file,upload_id=nil)
		t = Terf.create(organization_id:affiliate_id,upload_id:upload_id)
		CSV.foreach(file.tempfile,headers:false) do |row|
			street_num,street_name = row[2].match(/(\d+-?\d?+)(.*)/)[1,2]
			TerfEntry.create(first_name:row[0],last_name:row[1],street_number:street_num,street_name:street_name.strip,city:row[3],state:row[4],zip:row[5],county:row[6],terf_id:t.id)
		end
	end
end


# rpatel@brooksource.com 
