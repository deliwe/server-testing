require 'debian_package_verifier.rb'

def verify_debian_packages #checking all the essential debian packages
  file=File.open("debian_packages.txt")
  file.each_line do |line| 
  
  if !$installed_packages.include?(line.gsub(/\n/,""))
  package=Debian_packages_verifier.new
    
  if package.verify_one_debian_package($installed_packages,line)
							 puts "#{line.chop} is installed."
							else
								puts "#{line.chop} is not installed."
						end
					end
			end
		file.close
end
verify_debian_packages
