file = File.open("/usr/bin/gem")

file.readlines {|r| puts r}
