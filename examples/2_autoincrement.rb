#!/usr/bin/env ruby

require 'redis'

def get_pk(item, db)
  pk = db.incr "#{item}:pk"
  "#{item}:#{pk}"
end

db = Redis.new
db.flushall unless ENV['NOFLUSH']

db.hmset get_pk('movie', db), 'name', 'Top Gun', 'genre', 'Action'
db.hmset get_pk('movie', db), 'name', 'D.A.R.Y.L', 'genre', 'Action'
