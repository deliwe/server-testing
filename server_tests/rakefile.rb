desc 'Default task'
	task :default => :server_tests do
		puts "Server tests\n"
	end

desc 'Server tests'
	task :server_tests do
		puts "\n"
		require 'dpkgs_uninstalled_list.rb'
		puts "\n"
		 
		puts "\n"
		require 'gems_uninstalled_list.rb'
		puts "\n"
			 
		puts "MySQL root password.....\n"
		require 'mysql_root_passwd_verifier.rb'
		puts "\n"
	end
