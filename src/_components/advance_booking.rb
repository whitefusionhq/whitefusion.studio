require "ice_cube"
require "active_support/time"

class AdvanceBooking < Bridgetown::Component
  def initialize(blocked_dates:)
    @blocked_dates = blocked_dates.map do |date_string|
      Time.parse(date_string).to_datetime
    end
  end

  def hour_dates
    # Tuesdays

    schedule = IceCube::Schedule.new

    # 10:00 AM
    schedule.add_recurrence_rule(
      IceCube::Rule.weekly.day(:tuesday)
        .hour_of_day(10)
        .minute_of_hour(0)
        .second_of_minute(0)
    )

    # 2:00 PM
    schedule.add_recurrence_rule(
      IceCube::Rule.weekly.day(:tuesday)
        .hour_of_day(14)
        .minute_of_hour(0)
        .second_of_minute(0)
    )

    schedule.occurrences(6.weeks.from_now).reject do |date|
      @blocked_dates.find { _1 == date }
    end
  end

  def morning_dates
    # Fridays

    schedule = IceCube::Schedule.new

    # 9:00 AM
    schedule.add_recurrence_rule(
      IceCube::Rule.weekly.day(:friday)
        .hour_of_day(9)
        .minute_of_hour(0)
        .second_of_minute(0)
    )

    schedule.occurrences(6.weeks.from_now).reject do |date|
      @blocked_dates.find { _1 == date }
    end
  end
end
