
@@gems_installed_list=[]
  file=File.new("gems_list.txt","w+")
		Dir.foreach("/usr/lib/ruby/gems/1.8/cache"){
		|gem| @@gems_installed_list << gem  }
	    file.close	
	    
@@gems_installed_list.each do |gem|
puts gem.gsub(/.\d|.gem/,"") end  

def verify_installed_gems #checking all the essential debian packages

		file = File.open("gems_list.txt")
			file.each_line{|line|
		
		if !@@gems_installed_list.include?(line.gsub(/.\d|.gem/,"") )
		  puts "#{line.chop} is installed."
		else
		  puts "#{line.chop} is not installed."
		end
	}
end
verify_installed_gems 
