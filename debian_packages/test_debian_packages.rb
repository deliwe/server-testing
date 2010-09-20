require 'test/unit'
require 'debian_package_verifier.rb'
require 'verify_debian_packages.rb'

class Test_Debian_Package_verifier  < Test::Unit::TestCase #testing methods in debian_packages.rb
	def test_debian_packages #testing verify debian package method 
		#assert_equal(verify_debian_packages,true)
		assert_raise("Not Installed") do
		    !verify_one_debian_package() end
	end
	def test_one_debian_package #testing verify one debian package
		assert_equal(Debian_packages_verifier.new.verify_one_debian_package(['irb1.8', 'rdoc1.8'], 'irb'),true)
		assert_equal(Debian_packages_verifier.new.verify_one_debian_package(['irb', 'rdoc'], 'notIrb'),false)
	end
end