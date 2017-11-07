namespace :seed do

  desc "generate seeds"

  task :generate, [:file_name] => :environment do |task, args|
  	path = Rails.root.join('db','seeds').to_s+"/"
  	timestamp = Time.now.strftime("%Y%m%d%H%M%S")+"_"
  	filename = args.file_name+".rb"
  	FileUtils.touch(path + timestamp + filename)
  	puts "Generated empty seed file called #{filename}"
  end

  desc "load seeds"
  task :load, :environment do 
  	time = Time.now.strftime("%Y%m%d%H%M%S")
  	factories = Rails.root.join('spec','factories.rb')
  	load(factories)
  	binding.pry
  	Dir[Rails.root.join('db', 'seeds', '*.rb')].each do |file|
  		load(file)
  	end
  end

end
