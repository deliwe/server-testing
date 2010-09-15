class Check_installed_gems
	@@important_gems=[]
	@@installed_gems=[]
	@@uninstalled_gems=[]
	
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
			 true
		else
			false
		end
	end
end

require 'test/unit'
require 'check_ruby_gems.rb'

class Test_installed_gems  < Test::Unit::TestCase
	def test_gems_exist #testing if the important gems are installed
		@gem="prawn"
		assert_equal(Check_installed_gems.new.check_installed_gems(@gem),false,"#{@gem} not installed") 
	end
end
