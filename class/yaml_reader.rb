require File.expand_path("../../helper/my_module.rb", __FILE__)
require File.expand_path("../key_absen_error.rb", __FILE__) 
require 'pry'
require 'ostruct'

class YamlReader < OpenStruct
	include MyModule
	attr_reader :marsh
	def initialize(link=nil, data= true)
		if link
			x = get_open(link, data)
			super x
		else 
			return super()
		end		
	end
	def method_missing(meth, *args)
		raise KeyAbsentError.new(self[:marsh], meth) unless meth.to_s.end_with?('=')
	end
	def to_ary
	end
end