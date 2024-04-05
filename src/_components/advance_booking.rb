class AdvanceBooking < Bridgetown::Component
  def initialize(label:, placeholder:, blocked_dates:)
    @label, @placeholder = label, placeholder

    @blocked_dates = blocked_dates.map do |date_string|
      Time.parse(date_string).to_datetime
    end

    @until = 6.weeks.from_now
  end

  def option_icons = html -> { <<~HTML
    <sl-icon slot="prefix" name="calendar2-week-fill" style="color: var(--primary-color")></sl-icon>
    <sl-icon slot="suffix" name="clock-fill" style="color: var(--primary-faded-color)"></sl-icon>
  HTML
  }

  def date_display_format = "%A, %B %-d, %Y @ %-I:%M %p"

  def make_schedule = IceCube::Schedule.new

  def add_rule(schedule, day_of_week, hour)
    schedule.add_recurrence_rule(
      IceCube::Rule.weekly.day(day_of_week)
        .hour_of_day(hour)
        .minute_of_hour(0)
        .second_of_minute(0)
    )
  end

  def remove_blocked_dates(schedule)
    schedule.occurrences(@until).reject do |date|
      @blocked_dates.find { _1 == date }
    end
  end

  def free_dates
    # Wednesdays

    make_schedule.tap do |schedule|
      # 4:00 PM
      add_rule schedule,
               :wednesday,
               4 + 12
    end.then { remove_blocked_dates _1 }
  end

  def hour_dates
    # Tuesdays

    make_schedule.tap do |schedule|
      # 10:00 AM
      add_rule schedule,
               :tuesday,
               10

      # 3:00 PM
      add_rule schedule,
               :tuesday,
               3 + 12
    end.then { remove_blocked_dates _1 }
  end

  def morning_dates
    # Wednesdays

    # 10:00 AM
    make_schedule.tap do |schedule|
      add_rule schedule,
               :wednesday,
               10
    end.then { remove_blocked_dates _1 }
  end
end
