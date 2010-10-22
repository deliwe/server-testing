#!/usr/bin/ruby -w
# Saving installed gems into and array 
# from ("/usr/lib/ruby/gems/1.8/cache") 
# and verifying if they are installed
#
class GemsVerifier
  
  $installed_gems = []
  $uninstalled_gems = []
  
	#saving installed gems in an array
	#	
	begin
	  Dir.foreach("/usr/lib/ruby/gems/1.8/cache") do |gem|
		  $installed_gems << gem.gsub(/.\d|.gem|\s/,"")
	  end
	rescue Exception => err
	 puts "Error: #{err}"
	end
  
  #verify if all gems are installed
  #
  def verify_gems
    begin
      IO.foreach("gems_list.txt") do |line|	
        if !$installed_gems.include?( line.gsub(/.\d|\s|\)|\,|\d/,"") )	
          $uninstalled_gems << line				
        end
	    end
    rescue Exception => err
      puts "Error: #{err}" 
    end
    $uninstalled_gems  
  end
  
end
gems = GemsVerifier.new
gems.verify_gems
