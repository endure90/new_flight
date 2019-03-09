#
class Trip
  def initialize(from, to, departing, returning)
    @from = from || 'Xian'
    @to = to || 'Chengdu'
    @departing = departing
    @returning = returning
  end

  def trip_info
    {
      from: @from,
      to: @to,
      departing: @departing,
      returning: @returning
    }
  end
end
