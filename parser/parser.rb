#!/usr/bin/env ruby

path_to_load = File.join(File.dirname(__FILE__), 'lib')
$:.unshift(File.expand_path(path_to_load)) unless $:.include?(path_to_load) || $:.include?(File.expand_path(path_to_load))

require 'logs'

path = File.expand_path(ARGV[0], Dir.pwd)
Logs.new(path).export_recursively_to_csv!
