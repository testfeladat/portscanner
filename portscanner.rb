#!/usr/bin/ruby
require 'socket'
require 'timeout'
require "csv"

puts "PORT SCANNER APP"
puts "The app scenner ports between 10 and 30 and write data in csv file "
print "Write in the IP Address or domain to scan:"

ip = gets.chomp
ports= 10..30

ports.each do |sc|
  begin
    Timeout::timeout(5){TCPSocket.new("#{ip}",sc)}
  rescue
    CSV.open("resoult.csv", "a+") do |csv|
      csv << ["Timestamp","IP", "Port", "Open/Closed"]
      csv << ["#{Time.now}", "#{ip}","#{sc}", "Closed"]
    end
    puts "Closed port: #{sc}"
  else
    CSV.open("resoult.csv", "a+") do |csv|
      csv << ["Timestamp","IP", "Port", "Open/Closed"]
      csv << ["#{Time.now}", "#{ip}","#{sc}", "Open"]
    end
    puts "Open port: #{sc}"
  end
  sleep(2)
end

puts "You can read the data from resoult.csv file in this library"
