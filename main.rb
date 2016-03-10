#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'libs'))

require 'controller'
MarsRovers.run


# to run tests rvm use 1.9.3-p545
# test/main_test.rb