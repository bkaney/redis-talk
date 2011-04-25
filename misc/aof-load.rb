#!/usr/bin/env ruby

loop do
    sleep 1
    puts " * Waiting for aof to load..."
    load_status = %x{ echo "INFO" | redis-cli | grep loading }[/\:([0-9])/,1]
    break if load_status == "0"
end

puts "done"
