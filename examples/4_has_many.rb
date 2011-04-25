#!/usr/bin/env ruby

require 'redis'
require 'json'

db = Redis.new
db.flushall unless ENV['NOFLUSH']

# Make a few jets
db.hmset 'jet:1', 'manufacturer', 'Grumman', 'model', 'F-14'
db.hmset 'jet:2', 'manufacturer', 'Northrop', 'model', 'F-5'

# Make our movie
db.hmset 'movie:1', 'name', 'Top Gun', 'jets', %w(jet:1 jet:2).to_json
