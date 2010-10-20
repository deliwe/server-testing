require 'mysql'
class Mysql_root_passwd_verifier
  $con=""
  def verify_mysql_root_passwd
    begin
      $t_host='localhost' 
      $t_user='root'
      $t_passwd=''
      
      #connect to the MYSQL server
      con = Mysql.new($t_host, $t_user, $t_passwd)
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
  end
end
root_passwd = Mysql_root_passwd_verifier.new
root_passwd.verify_mysql_root_passwd
