desc 'Default task'
task :default => :server_tests do
 puts "Server tests\n"
end

desc 'Server tests'
task :server_tests do
	puts "Verifying installed debian packages.....\n"
	require 'verify_debian_packages.rb'
	puts "\n"
	 
	puts "Verifying installed gems.....\n"
	require 'gem_list_verifier.rb'
	puts "\n"
		 
	puts "Verifying MySQL root password.....\n"
	require 'mysql_root_passwd_verifier.rb'
	puts "\n"
end
