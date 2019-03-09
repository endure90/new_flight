#!/usr/bin/ruby

class Flight
  FLIGHTS = Array[{
    'name': 'GD2501',
    'SCHED': '08:00',
    'FROM': 'Xian',
    'TO': 'Chengdu',
    'regular': {
      'WEEKDAYS': 1100,
      'WEEKENDS': 900
    },
    'reward': {
      'WEEKDAYS': 800,
      'WEEKENDS': 500
    }
  }, {
    'name': 'GD2606',
    'SCHED': '12:25',
    'FROM': 'Xian',
    'TO': 'Chengdu',
    'regular': {
      'WEEKDAYS': 1600,
      'WEEKENDS': 600
    },
    'reward': {
      "WEEKDAYS": 1100,
      "WEEKENDS": 500
    }
  },
  {
    'name': 'GD8732',
    'SCHED': '19:30',
    'FROM': 'Xian',
    'TO': 'Chengdu',
    'regular': {
      'WEEKDAYS': 2200,
      'WEEKENDS': 1500
    },
    'reward': {
      "WEEKDAYS": 1000,
      "WEEKENDS": 400
    }
  },
  {
    'name': 'GD2502',
    'SCHED': '12:00',
    'FROM': 'Chengdu',
    'TO': 'Xian',
    'regular': {
      'WEEKDAYS': 1700,
      'WEEKENDS': 900
    },
    'reward': {
      "WEEKDAYS": 800,
      "WEEKENDS": 800
    }
  }, {
    'name': 'GD2607',
    'SCHED': '16:25',
    'FROM': 'Chengdu',
    'TO': 'Xian',
    'regular': {
      'WEEKDAYS': 1600,
      'WEEKENDS': 600
    },
    'reward': {
      "WEEKDAYS": 1100,
      "WEEKENDS": 500
    }
  },{
    'name': 'GD8733',
    'SCHED': '23:30',
    'FROM': 'Chengdu',
    'TO': 'Xian',
    'regular': {
      'WEEKDAYS': 1600,
      'WEEKENDS': 1000
    },
    'reward': {
      "WEEKDAYS": 1500,
      "WEEKENDS": 400
    }
  }]
  def initialize(type, from, to, day_type)
    @flights = []
    puts day_type
    FLIGHTS.map do |flight|
      trip = {}
      next unless flight[:FROM] == from && flight[:TO] == to
      trip[:name] = flight[:name]
      trip[:SCHED] = flight[:SCHED]
      customer_type = type.downcase
      if customer_type == 'regular'
        prices = flight[:regular]
      elsif customer_type == 'reward'
        prices = flight[:reward]
      end

      if day_type == 'WEEKDAYS'
        prices = prices[:WEEKDAYS]
      elsif day_type == 'WEEKENDS'
        prices = prices[:WEEKENDS]
      end
      trip[:price] = prices
      @flights.push trip
    end
  end

  def can_choose_flights
    @flights
  end

  def sort_by_price
    @flights.sort_by! { |a| a[:price] }
  end
end
