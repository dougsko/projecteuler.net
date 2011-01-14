#!/usr/bin/env ruby
# ringserver.rb
# Rinda RingServer

require 'rinda/ring'
require 'rinda/tuplespace'

DRb.start_service

ts = Rinda::TupleSpace.new
place = Rinda::RingServer.new(ts)

DRb.thread.join
