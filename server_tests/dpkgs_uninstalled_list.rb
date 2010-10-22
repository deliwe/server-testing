#!/usr/bin/ruby -w
# listing the unistalled debian packages from dpkgs_verifier.rb
# and message if all installed
#
require 'dpkgs_verifier.rb'

class DpkgsUninstalledList
  def list_uninstalled_dpkgs  
    if $uninstalled_pkgs.count == 0
      puts" All important debian packages are installed"
    else
      puts " List of unistalled debian packages.."
	    $uninstalled_pkgs.each{ |pkg| puts pkg }
    end
  end
end
gems = DpkgsUninstalledList.new
gems.list_uninstalled_dpkgs
