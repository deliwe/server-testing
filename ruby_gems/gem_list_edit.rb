class Check_installed_gems
	@@important_gems=[]
	@@installed_gems=[]
	
	def store_installed_gems #saving the installed gems in a text file
	    file=File.new("gems_list.txt","w+")
		Dir.foreach("/usr/lib/ruby/gems/1.8/cache"){
		|gem| file.puts("#{gem}") }
	    file.close	
	end
    
	def check_installed_gems(value)
		@gem=value
		file = File.open("gems_list.txt")
			file.each_line{|line| @@installed_gems << line.gsub(/.\d|.gem/,"") } 
		file.close
		
		if @@installed_gems.include?(@gem) == false 
			 false
		else
			true
		end
	end
	
end
gems = Check_installed_gems.new
puts  gems.check_installed_gems("thoughtbolt")

