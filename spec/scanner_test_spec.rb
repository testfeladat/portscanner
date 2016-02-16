require_relative 'dem'

describe Dem  do
	before do
		@dem = Dem.new("test","192.168.1.1",'23')
	end

	if 'has a connection name is' do
		expect(@dem.name).to eql('test')
	end
end