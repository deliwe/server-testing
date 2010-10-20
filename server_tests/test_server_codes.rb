require 'test/unit'
require 'gems_verifier'
require 'dpkgs_verifier'
require 'mysql_root_passwd_verifier'

class Test_installed_gems  < Test::Unit::TestCase
	
	def test_uninstalled_gems 
		#testing if uninstalled gems are populated
		assert($uninstalled_gems.empty?,"Uninstalled gems\n#{$uninstalled_gems}")
	end
	
	def test_installed_gems
	  #testing if installed gems are populated
	  assert(!$installed_gems.empty?,"Installed gems")
	end
	
	def test_uninstalled_dpkgs
	  #testing if uninstalled debian packages are populated
    assert($uninstalled_pkgs.empty?,"Uninstalled dpkgs\n#{$uninstalled_pkgs}")
	end
	
	def test_installed_dpkgs
	  #testing if installed dpkgs are populated
	  assert(!$installed_pkgs.empty?,"Installed debian pkgs")
	end
	
	def test_mysql_connection
	  #testing if the variables are entered correctly
	  @t_host='localhost' 
    @t_user='root'
    @t_passwd=''
      
	  assert_equal($t_host, @t_host, "Mysql_root_password verifier")
	  assert_equal($t_user, @t_user, "Mysql_root_password verifier")
	  assert_equal($t_passwd, @t_passwd, "Mysql_root_password verifier")
	end
end
