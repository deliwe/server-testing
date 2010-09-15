class Debian_packages_verifier
   $installed_packages=[]
   Dir.foreach("/var/lib/dpkg/info"){|pkg| $installed_packages << pkg}
   $installed_packages
	
	def verify_one_debian_package(installed_packages,package)#checking one debian package
		@package=package
		@installed_packages=installed_packages
		
		@installed_packages.include?(@package)
			
	end
end

def verify_debian_packages#checking all the essential debian packages
		@@uninstalled_debian_packages=[]
		puts $installed_packages.inspect
		
		file=File.open("essential-packages.txt")
			file.each_line do |line| 
				@@uninstalled_debian_packages << line if $installed_packages.include?(line.gsub(/\n/,"")) ==false end
		file.close
		@@uninstalled_debian_packages.each do |p| 
			package = Debian_packages_verifier.new
			p.chop!
			 if package.verify_one_debian_package($installed_packages,p)
				 puts "#{p} is installed."
				 else
					 puts "#{p} is not installed."
				 end
			end
end
		
verify_debian_packages
