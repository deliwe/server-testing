require 'test/unit'

class Check_installed_gems
	def store_installed_gems #saving the installed gems in a text file
		file=File.new("gems_list.txt","w+")
		Dir.foreach("/usr/lib/ruby/gems/1.8/cache"){
		|gem| file.puts("#{gem}") }
	end
end

class Test_installed_gems  < Test::Unit::TestCase
	@@important_gems=[]
	@@installed_gems=[]
	
	def test_gems_exist #testing if the important gems are installed
		file1 = File.open("important_gems_list.txt")
			file1.each_line{|line1| @@important_gems << line1.gsub(/[\s+.\d+.\d+.\d+\)+\(+\,]/,"")}
		file1.close
		
		file = File.open("gems_list.txt")
			file.each_line{|line| @@installed_gems << line.gsub(/\-+\d+.\d+.\d+.gem+\n/,"") } 
		file.close
		
		@@important_gems.map do |gem| 
		assert("#{if @@installed_gems.count(gem) < 1 then puts gem +' not installed' end}" )  
	       end
	end
end