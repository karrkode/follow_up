5.times { FactoryGirl.create(:upload,uploader_id:1,affiliate_id:[1,2,3].sample)}

puts 'seed file was loaded'