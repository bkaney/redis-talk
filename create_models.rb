#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/models'

r = Redis.new
r.flushdb

top_gun = Movie.create(:title => 'Top Gun', :genre => 'Action')
top_gun.jets << Jet.create(:manufacturer => 'Grumman', :model => 'F-14')
top_gun.jets << Jet.create(:manufacturer => 'Northrop', :model => 'F-5')

Character.create(:name => 'Iceman', :movie => top_gun)
Character.create(:name => 'Mavrick', :movie => top_gun)

daryl = Movie.create(:title => 'D.A.R.Y.L', :genre => 'Action')
daryl.jets << Jet.create(:manufacturer => 'Grumman', :model => 'F-14')
daryl.jets << Jet.create(:manufacturer => 'Lockheed Martin', :model => 'SR-71')

airplane = Movie.create(:title => 'Airplane', :genre => 'Comedy')
airplane.jets << Jet.create(:manufacturer => 'Airbus', :model => 'A400')
