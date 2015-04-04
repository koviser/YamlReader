require 'yaml'
require 'pry'
require 'ostruct'
module MyModule
	Dir = File.dirname(File.expand_path("../",__FILE__)) + '/data/'
	attr_reader :file
	
	def get_open(file, data)
		@file = data ? Dir+file : file
		yaml = YAML::load(File.open(@file))
		hash_open yaml
	end

	def hash_open(hash, marsh = "")
		os = self.class.new
		os[:marsh] = marsh
		hash.each do |key, value|
			if value.instance_of? Hash
				os[key] = hash_open(value, os[:marsh]+"/"+key)
			else
				os[key] = value
			end
		end
		os
	end


end