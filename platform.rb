# !/usr/bin/ruby

require_relative 'flight.rb'
require 'time'

class Platform
  WEEKDAY = Array['MON', 'TUE', 'WED', 'THU', 'FRI']
  WEEKEND = Array['SAT', 'SUN']
  OPTIMAL_TIME = '12:00'
  def initialize(type, trip)
    @type = type
    @from = trip[:from]
    @to = trip[:to]
    @departing_date = trip[:departing]
    @returning_date = trip[:returning]
  end

  def optimal_choice
    day_type = day_type(@departing_date)
    from_flights = Flight.new(@type, @from, @to, day_type).sort_by_price
    to_flights = Flight.new(@type, @to, @from, day_type).sort_by_price
    from_flight = choose_best_one(from_flights)
    to_flight = choose_best_one(to_flights)
    {
      from_flight: from_flight,
      to_flight: to_flight
    }
  end

  def choose_best_one(flights)
    best_one = flights[0]
    best_time = (DateTime.parse(best_one[:SCHED]) - DateTime.parse(OPTIMAL_TIME)).abs()
    len = flights.count
    flights.each_index do |index|
      break if len == index + 1
      current_flight = flights[index + 1]
      #时间判断TODO
      next if best_one[:price] != current_flight[:price]
      diff_time = (DateTime.parse(best_one[:SCHED]) - DateTime.parse(current_flight[:SCHED])).abs()
      if best_time > diff_time
        best_one = current_flight
        best_time = diff_time
      end
    end
    best_one
  end

  def day_type(time)
    day = time[8...11]
    if WEEKDAY.include?(day)
      'WEEKDAYS'
    elsif WEEKEND.include?(day)
      'WEEKENDS'
    else
      ''
    end
  end
end
