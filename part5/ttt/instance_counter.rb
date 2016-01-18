module InstanceCounter

	def self.included(base)
		base.extend(ClassMethods)
	end		
	
  module ClassMethods
		attr_accessor :instance_count			
		
		def initialize
			self.instance_count = 0 if self.instance_count.nil?
		end

		def instances
			puts "Hello from instances"
			puts "Instances = #{self.instance_count}"
		end

	end

	def register_instance
		self.class.instance_count += 1
	end
	
end
