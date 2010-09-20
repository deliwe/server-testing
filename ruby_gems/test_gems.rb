require 'test/unit'
require 'gem_list_verifier.rb'

class Test_installed_gems  < Test::Unit::TestCase
	def test_gems_exist #testing if the important gems are installed
		assert_equal(list_uninstalled_gems,true)
	end
end