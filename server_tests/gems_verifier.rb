#!/usr/bin/ruby -w
# Saving installed gems 
#

class GemsVerifier
  
  $installed_gems = []
  $uninstalled_gems = []
  	
	begin
	  Dir.foreach("/usr/lib/ruby/gems/1.8/cache") do |gem|
		  $installed_gems << gem.gsub(/.\d|.gem|\s/,"")
	  end
	rescue Exception => err
	 puts "Error: #{err.message}"
   puts "Error Line: #{err.backtrace.inspect}"
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
      puts "Error: #{err.message}"
   		puts "Error Line: #{err.backtrace.inspect}"
    end
  end
  
end

gems = GemsVerifier.new
gems.verify_gems
