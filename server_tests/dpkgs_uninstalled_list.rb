#!/usr/bin/ruby -w
# listing the unistalled debian packages from dpkgs_verifier.rb
#
require 'dpkgs_verifier.rb'

class DpkgsUninstalledList
  #list all uninstalled debian pkgs
  #
  def list_uninstalled_dpkgs  
	  puts " List of unistalled debian packages.."
	  $uninstalled_pkgs.each{ |pkg| puts pkg }
  end
end
gems = DpkgsUninstalledList.new
gems.list_uninstalled_dpkgs
