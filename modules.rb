module Company
	def brand
		puts 'Компания-производитель'
		@brand = gets.chomp
	end
end

module Main
  def self.included(base)
    base.extend InstanceCounter
    base.send :include, InstanceCounter
  end
end

module InstanceCounter
  attr_accessor :instances

	def instances
		self.register_instance
	end

  protected

  def register_instance
		@@instances ||= 0
		@@instances += 1
	end
end
