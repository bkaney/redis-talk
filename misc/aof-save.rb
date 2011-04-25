#!/usr/bin/env ruby

loop do
    sleep 1
    puts " * Waiting for aof to save..."
    save_status = %x{ echo "INFO" | redis-cli | grep bgrewriteaof_in_progress }[/\:([0-9])/,1]
    break if save_status == "0"
end

puts "done"
