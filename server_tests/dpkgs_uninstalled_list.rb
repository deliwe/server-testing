require 'dpkgs_verifier.rb'

class Dpkgs_uninstalled_list
  def list_uninstalled_dpkgs
    #list all uninstalled debian pkgs
    
    if !File.exists?("debian_packages.txt")
      puts "\n"
    elsif $uninstalled_pkgs.empty? 
      puts "All important debian packages are installed"
    else 
	    puts "List of unistalled debian packages"
	    $uninstalled_pkgs.each{ |pkg| puts pkg }
	  end
  end
end
gems=Dpkgs_uninstalled_list.new
gems.list_uninstalled_dpkgs
