require 'socket'

class Dem
	attr_accessor :name, :network_name, :network_port

	def initialize(name,network_name,network_port)
		@name = name
		@network = network_name
		@port = network_port
	end

	def connect
		socket =TCPSocket.new(@name,@network,@port)
	end
end