#!/usr/bin/ruby -w
#list uninstalled gems
#
require 'gems_verifier.rb'

class GemsUninstalledList

  def list_uninstalled_gems 
    
    if $uninstalled_gems.count == 0
      puts " All important gems are installed"
    else   
      puts " List of unistalled gems.."
	    $uninstalled_gems.each{ |gem| puts gem.chop }
	  end
  end
end

gems = GemsUninstalledList.new
gems.list_uninstalled_gems
