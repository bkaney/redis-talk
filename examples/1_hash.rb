#!/usr/bin/env ruby

require 'redis'

db = Redis.new
db.flushall unless ENV['NOFLUSH']

db.hmset 'movie:1', 'name', 'Top Gun', 'genre', 'Action'
