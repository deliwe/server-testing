class Debian_packages_verifier
   $installed_packages=[]
   Dir.foreach("/var/lib/dpkg/info") do |pkg|
   $installed_packages << pkg.gsub(/.list/,"") if  pkg.to_s.include?('.list') end


  def verify_one_debian_package(installed_packages,package) #checking one debian package
    @package=package
    @installed_packages=installed_packages
    
     @installed_packages.include?(@package)
   end
end

