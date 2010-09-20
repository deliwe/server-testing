class Gems_verifier
  def verify_installed_gems #saving the installed gems in a text file
     $important_gems=[] 
     $installed_gems=[]
		
     file=File.new("gems_list.txt","w+")
        Dir.foreach("/usr/lib/ruby/gems/1.8/cache"){
	  |gem| file.puts("#{gem}") }
     file.close	
		
     file1 = File.open("important_gems_list.txt")
	 file1.each_line{|line1| $important_gems << line1.gsub(/.\d|\s|\)|\,|\d/,"")}
     file1.close
     #$important_gems
		
     file = File.open("gems_list.txt")
	file.each_line{|line| $installed_gems << line.gsub(/.\d|.gem|\s/,"") } 
     file.close
    # $installed_gems
 end
end
gems=Gems_verifier.new
gems.verify_installed_gems
