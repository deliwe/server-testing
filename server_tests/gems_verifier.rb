# Saving installed gems into and array 
# from ("/usr/lib/ruby/gems/1.8/cache") 
# and verifying if they are installed
#
class GemsVerifier
  $installed_gems = []
  $uninstalled_gems = []
  
	#saving installed gems in an array
	#	
	Dir.foreach("/usr/lib/ruby/gems/1.8/cache") do |gem|
		$installed_gems << gem.gsub(/.\d|.gem|\s/,"")
	end
  
  #verify if all gems are installed
  #
  def verify_gems
    if !File.exists?("gems_list.txt")
      puts "gems_list.txt doesn't exists"
    else
      IO.foreach("gems_list.txt") do |line|	
        if !$installed_gems.include?( line.gsub(/.\d|\s|\)|\,|\d/,"") )	
          $uninstalled_gems << line				
        end
	    end
	    $uninstalled_gems
	  end
  end
end
gems = GemsVerifier.new
gems.verify_gems
