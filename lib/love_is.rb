#!/usr/bin/env ruby

require 'yaml'

module LoveIs
  VERSION = 0.1.3
end

%w(node parser generator).each { |x| require_relative 'love_is/' << x }
