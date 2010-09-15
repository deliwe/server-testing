file=File.open("practice.txt","w")
gem_list=[]
important_gems=[]

file=File.open("gems_list.txt","w+")
		Dir.foreach("/usr/lib/ruby/gems/1.8/cache"){
		|gem| gem_list << gem }
		
Dir.foreach("/usr/lib/ruby/gems/1.8/cache"){
		|gem|  important_gems << gem if gem=~/activere+|action+|cap+|cgi+|dae+|fast+|gem_+|js+|mech+|mong+|net-+|noko+|pra+|rac+|rak+|rspec+|rubyz+|though+/}
		important_gems.sort
#puts gem_list.sort & important_gems.sort

file=File.open("gems_list.txt","w+")
		Dir.foreach("/usr/lib/ruby/gems/1.8/cache"){
		|gem| file.puts("#{gem}") }