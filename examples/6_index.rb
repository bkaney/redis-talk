#!/usr/bin/env ruby

require 'redis'

db = Redis.new
db.flushall unless ENV['NOFLUSH']

# Create a few movies
db.hmset 'movie:1', 'name', 'Top Gun', 'genre', 'Action'
db.hmset 'movie:2', 'name', 'Top Gun', 'genre', 'Action'
db.hmset 'movie:3', 'name', 'Airplane', 'genre', 'Comedy'

# Create an index on 'genre'
db.sadd 'movie:index:genre:Action', 'movie:1'
db.sadd 'movie:index:genre:Action', 'movie:2'
db.sadd 'movie:index:genre:Comedy', 'movie:3'
