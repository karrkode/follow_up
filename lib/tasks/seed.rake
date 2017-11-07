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
  task load_seeds: :environment do 
  end

  # private #refactor

  # def extract_file_name
  # 	options = {}
  # 	OptionParser.new do |opts|
	 #    opts.banner = "Usage: rake seed [options]"
	 #    opts.on('-n','--name STRING',String) do |name|
	 #    	binding.pry
	 #    	options[:name] = name
	 #    end
  # 	end.parse!
  # 	binding.pry
  # 	options
  # end

end
