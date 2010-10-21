class Gems_verifier
  $installed_gems = []
  $uninstalled_gems = []
  
	#saving installed gems in an array	
	Dir.foreach("/usr/lib/ruby/gems/1.8/cache") do |gem|
		$installed_gems << gem.gsub(/.\d|.gem|\s/,"")
	end
  
  def verify_gems
   #verify if all gems are installed
   if !File.exists?("gems_list.txt")
      puts "gems_list.txt doesn't exists"
   else
      IO.foreach("gems_list.txt") do |line|	
        if !$installed_gems.include?(line.gsub(/.\d|\s|\)|\,|\d/,""))	
          $uninstalled_gems << line				
        end
	    end
	    $uninstalled_gems
	 end
  end
end
gems = Gems_verifier.new
gems.verify_gems
