class Debian_pkg_verifier
  
  $installed_pkgs=[]
  $uninstalled_pkgs=[]
  
  Dir.foreach("/var/lib/dpkg/info") do |pkg|
    if  pkg.to_s.include?('.list')
      $installed_pkgs << pkg.gsub(/.list/,"") 
    end
  end
  
  def verify_debian_pkgs
    IO.foreach("debian_packages.txt") do |line|
      if !$installed_pkgs.include?(line.gsub(/\n|\s/,""))
		    $uninstalled_pkgs << line
	    end
    end
    $uninstalled_pkgs
  end
end
dpkg=Debian_pkg_verifier.new
dpkg.verify_debian_pkgs
