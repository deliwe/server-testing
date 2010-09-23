require 'mysql'

begin
 #connect to the MYSQL server
 con = Mysql.new("localhost","root","")
 puts "Root has no password"
rescue Mysql::Error => e
	if e.error.match(/^Access denied for user \'root\'/)
		puts "It seems root has a password"
	else
		puts "An error not associated to access credentials has occured"
		puts "Error code: #{e.error}"
	end  
  ensure
  con.close if con
end
