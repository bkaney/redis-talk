#!/usr/bin/env ruby

require 'redis'

db = Redis.new
db.flushall unless ENV['NOFLUSH']

db.hmset 'movie:1', 'name', 'Top Gun', 'genre', 'Action'

# Create a character that references the movie
db.hmset 'character:1', 'name', 'Maverick', 'movie_id', 'movie:1'
