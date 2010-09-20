require 'save_installed_gems.rb'
 
def list_uninstalled_gems
  $important_gems.each do |gem|
  if !$installed_gems.include?(gem) 
      puts "#{gem} not installed" 
     end	
  end 
end
list_uninstalled_gems
