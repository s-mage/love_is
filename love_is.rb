#!/usr/bin/env ruby

module LoveIs
end

require_relative 'lib/love_is/node'
require_relative 'lib/love_is/parser'
require_relative 'lib/love_is/generator'

generator = LoveIs::Generator.new.parse_file('data')
puts generator.generate
