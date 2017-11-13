class SeedGenerator < Rails::Generators::Base
	class_option :unique, type: :boolean, default:false


	desc "This generator creates a seed file"
  def create_initializer_file
  	timestamp = Time.now.strftime("%Y%m%d%H%M%S")+"_"
  	filename = timestamp+args[0]+".rb"
    create_file 'db/seeds/'+filename, seed_file(args[0],args[1],options[:unique])
  end


  def seed_file(model,count,unique=false)
  	file = ""
  	if unique == false
  		file.concat( 
"#{count.nil? ? 1 : count.to_i}.times do 
	FactoryGirl.create(:#{model})
end")
  	else 
  		count.to_i.times do |count|
  			file <<"#{model+count.to_s} =  FactoryGirl.create(:#{model})\n"
  		end
  	end
  	return file
  end

end