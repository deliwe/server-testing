require 'gems_verifier.rb'

class Gems_uninstalled_list
  def list_uninstalled_gems
    if !File.exists?("important_gems_list.txt")
      puts "\n"
    elsif $uninstalled_gems.empty?
      puts"All important gems are installed"
    else     
      #list all uninstalled gems
	    puts "List of unistalled gems.."
	    $uninstalled_gems.each{ |gem| puts gem.chop }
	  end
  end
end
gems=Gems_uninstalled_list.new
gems.list_uninstalled_gems
