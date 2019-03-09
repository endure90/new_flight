
require_relative 'platform.rb'
require_relative 'trip.rb'
require_relative 'customer.rb'

puts '请输入客户类型:'
customer_type = gets.chomp

puts '请输入出发时间:'
departing = gets.chomp

puts '请输入返回时间:'
returning = gets.chomp

trip = Trip.new('Xian', 'Chengdu', departing, returning)
trip_info = trip.trip_info
type = Customer.new(customer_type).type
platfrom = Platform.new(type, trip_info)
best = platfrom.optimal_choice

p best[:from_flight][:name]
p best[:to_flight][:name]
