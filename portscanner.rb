require 'socket'
require 'timeout'
require 'csv'

puts "PORT SCANNER APP"
puts "The app scanner ports 10 and 30 and write data in csv file"
print "Write in the IP or domain to scan:"

ip = gets.chomp
ports = 10..30

ports.each do |sc|
	begin
		Timeout::timeout(10){TCPSocket.new("#{ip}")}
	rescue
		CSV.open("resoult.csv","a+") do |csv|
			csv << ["Timestamp","IP-addr","Port", "Open/Closed"]
			csv << ["#{Time.now}","#{ip}","#{sc}", "Closed"]
		end
		puts "Closed port: #{sc}"
	else
		CSV.open("resoult.csv","a+") do |csv|
			csv << ["Timestamp","IP-addr","Port", "Open/Closed"]
			csv << ["#{Time.now}","#{ip}","#{sc}", "Open"]
		end
		puts "Open port: #{sc}"
	end
	sleep(2)
end
Puts "You can read the resoult from resoult.csv file in this folder!"