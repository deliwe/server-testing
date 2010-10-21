# listing the unistalled gemsc from gems_verifier.rb
#
require 'gems_verifier.rb'

class GemsUninstalledList
  def list_uninstalled_gems     
    puts " List of unistalled gems.."
	  $uninstalled_gems.each{ |gem| puts gem.chop }
  end
end
gems = GemsUninstalledList.new
gems.list_uninstalled_gems
