#!/usr/bin/ruby -w
# tests for the debian_packages, mysql_root_password_verifier
# and the ruby gems codes.
#
require 'test/unit'
require 'gems_verifier'
require 'dpkgs_verifier'
require 'mysql_root_passwd_verifier'

class TestInstalledGems  < Test::Unit::TestCase
	
	def test_uninstalled_gems 
		assert($uninstalled_gems.empty?,"Uninstalled gems\n#{$uninstalled_gems}") 
	end
	
	def test_installed_gems
	  assert(!$installed_gems.empty?,"Installed gems")
	end
	
	def test_uninstalled_dpkgs
    assert($uninstalled_pkgs.empty?,"Uninstalled dpkgs\n#{$uninstalled_pkgs}")
	end
	
	def test_installed_dpkgs
	  assert(!$installed_pkgs.empty?,"Installed debian pkgs")
	end
	
	def test_file_exists
	  assert(File.exists?('/var/lib/dpkg/info'), "/dpkg/info doesn't exists")
    assert(File.exists?('debian_packages.txt'),"dpkgs file doesn't exists") 
    assert(File.exists?('gems_list.txt'), "gems_list.txt doesn't exists")
    assert(File.exists?('/usr/lib/ruby/gems/1.8/cache'),
                        "/usr/lib/ruby/gems/1.8/cache")
  end
	
	def test_mysql_connection
	  assert_equal("localhost", $t_host, "Mysql_root_password verifier")
	  assert_equal("root", $t_user, "Mysql_root_password verifier")
	  assert_equal("", $t_passwd, "Mysql_root_password verifier")
	end
	
end
