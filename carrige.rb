require_relative 'modules'

class Carrige
	include Company
	
	attr_writer  :brand

	def initialize
		brand
	end
end
