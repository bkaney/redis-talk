#!/usr/bin/env ruby

require 'redis'

db = Redis.new
db.flushall unless ENV['NOFLUSH']

# Make a few jets
db.hmset 'jet:1', 'manufacturer', 'Grumman', 'model', 'F-14'
db.hmset 'jet:2', 'manufacturer', 'Northrop', 'model', 'F-5'

# Make our movie
db.hmset 'movie:1', 'name', 'Top Gun', 'genre', 'Action'


# Add to a key to represet the set of jets
db.sadd 'movie:1:jets', 'jet:1'
db.sadd 'movie:1:jets', 'jet:2'




# Let's make another jet
db.hmset 'jet:3', 'manufacturer', 'Lockheed Martin', 'model', 'SR-71'

# Let's make another movie
db.hmset 'movie:2', 'name', 'D.A.R.Y.L.', 'genre', 'Action'

# Add a few jets to D.A.R.Y.L.
db.sadd 'movie:2:jets', 'jet:3'
db.sadd 'movie:2:jets', 'jet:1'


# Print outs...
puts "Top Gun jets:"
puts db.smembers('movie:1:jets').inspect

puts "\n\nD.A.R.Y.L. jets:"
puts db.smembers('movie:2:jets').inspect

puts "\n\nWhich jets are in both Top Gun and D.A.R.Y.L.?"
puts db.sunion('movie:1:jets', 'movie:2:jets').inspect

puts "\n\nOnly in both movies?"
puts db.sinter('movie:1:jets', 'movie:2:jets').inspect

puts "\n\nOnes in Top Gun but not D.A.R.Y.L.?"
puts db.sdiff('movie:1:jets', 'movie:2:jets').inspect

