#!/usr/bin/ruby -w
# Saving installed dpkgs into and array from ("/var/lib/dpkg/info") 
# and verifying if they are installed
#
class DebianPkgVerifier

  $installed_pkgs = []
  $uninstalled_pkgs = []
  
  #saving installed debian packages in an array
	#
	begin	
    Dir.foreach( "/var/lib/dpkg/info" ) do |pkg|
      if  pkg.to_s.include?( '.list' )
        $installed_pkgs << pkg.gsub(/.list/,"") 
      end
    end
  rescue Exception => err
    puts "Error: #{err.message}"
   	puts "Error Line: #{err.backtrace.inspect}"
  end
  #verify if all debian packages are installed
  #
  def verify_debian_pkgs
    begin
      IO.foreach("debian_packages.txt") do |line|
        if !$installed_pkgs.include?( line.gsub(/\n|\s/,"") )
          $uninstalled_pkgs << line
        end
      end
    rescue Exception => err
      puts "Error: #{err.message}"
     	puts "Error Line: #{err.backtrace.inspect}" 
    end
  end

end
dpkg = DebianPkgVerifier.new
dpkg.verify_debian_pkgs
