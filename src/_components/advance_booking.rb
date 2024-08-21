class AdvanceBooking < Bridgetown::Component
  def initialize(label:, placeholder:, blocked_dates:)
    @label, @placeholder = label, placeholder

    @blocked_dates = blocked_dates.map do |date_string|
      Time.parse(date_string).to_datetime
    end

    @until = 3.weeks.from_now
  end

  def template # rubocop:disable Metrics
    <<~HTML
      <p>
        <sl-radio-group name="session_type" label="#{text -> { @label }}">
          <sl-radio-button value="free">
            <ui-label>#{text :free, -> { slotted }}</ui-label>
          </sl-radio-button>
          <sl-radio-button value="hour">
            <ui-label>#{text :double, -> { slotted }}</ui-label>
          </sl-radio-button>
          <sl-radio-button value="morning" checked>
            <ui-label>#{text :day, -> { slotted }}</ui-label>
          </sl-radio-button>
        </sl-radio-group>
        #{html -> { radio_group_styles }}
        <script type="module">
          const group = document.querySelector("sl-radio-group[name='session_type']")
          group.addEventListener("sl-change", () => {
            group.closest("form").querySelectorAll("sl-select").forEach(item => item.hidden = true)
            document.querySelector(`[name="${group.value}_date"]`).hidden = false
          })
        </script>
      </p>

      <p>
        <sl-select hidden name="free_date" placeholder="#{text -> { @placeholder }}">
          #{ html_map(free_dates) do |date|
            <<~HTML
              <sl-option value="#{text date.to_s, -> { tr " ", "_" }}">
                #{text date, -> { format_date }}
                #{html -> { option_icons }}
              </sl-option>
            HTML
          end }
        </sl-select>

        <sl-select hidden name="morning_date" placeholder="#{text -> { @placeholder }}">
          #{ html_map(morning_dates) do |date|
            <<~HTML
              <sl-option value="#{text date.to_s, -> { tr " ", "_" }}">
                #{text -> { date.strftime date_display_format }}
                #{html -> { option_icons }}
              </sl-option>
            HTML
          end }
        </sl-select>

        <sl-select hidden name="hour_date" placeholder="#{text -> { @placeholder }}">
          #{ html_map(hour_dates) do |date|
            <<~HTML
              <sl-option value="#{text date.to_s, -> { tr " ", "_" }}">
                #{text -> { date.strftime date_display_format }}
                #{html -> { option_icons }}
              </sl-option>
            HTML
          end }
        </sl-select>
      </p>

      #{html -> { content }}
    HTML
  end

  def radio_group_styles = <<~HTML
    <style>
      sl-radio-group[name='session_type']::part(button-group) {
        width: 100%;
      }

      sl-radio-group[name='session_type'] > sl-radio-button {
        flex-grow: 1;
      }

      @media (max-width: 900px) {
        sl-select::part(display-input) {
          font-size: var(--sl-font-size-small);
        }
        sl-radio-group[name='session_type'] {
          &::part(button-group__base) {
            display: grid;
          }

          & sl-radio-button {
            margin-inline-start: 0;

            &:not(:first-child)::part(button) {
              border-top: 0;
            }

            &::part(button) {
              border-radius: 0px;
            }

            &:first-child::part(button) {
              border-top-left-radius: 10px;
              border-top-right-radius: 10px;
            }

            &:last-child::part(button) {
              border-bottom-left-radius: 10px;
              border-bottom-right-radius: 10px;
            }
          }
        }
      }
    </style>
  HTML

  def option_icons = <<~HTML
    <sl-icon slot="prefix" name="calendar2-week-fill" style="color: var(--primary-color)"></sl-icon>
    <sl-icon slot="suffix" name="clock-fill" style="color: var(--primary-faded-color)"></sl-icon>
  HTML

  def date_display_format = "%A, %B %-d, %Y @ %-I:%M %p"

  def format_date(date) = date.strftime(date_display_format)

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
    # Tuesdays or Wednesdays

    make_schedule.tap do |schedule|
      # 12:00 PM
      add_rule schedule,
               :tuesday,
               12

      # 4:00 PM
      add_rule schedule,
               :wednesday,
               4 + 12
    end.then { remove_blocked_dates _1 }
  end

  def hour_dates # rubocop:disable Metrics
    # Mondays-Thursdays

    make_schedule.tap do |schedule|
      # Mon 3:00 PM
      add_rule schedule,
               :monday,
               3 + 12

      # Tues 9:00 AM
      add_rule schedule,
               :tuesday,
               9

      # Tues 3:00 PM
      add_rule schedule,
               :tuesday,
               3 + 12

      # Wed 12:00 PM
      add_rule schedule,
               :wednesday,
               12

      # Wed 3:00 PM
      add_rule schedule,
               :wednesday,
               3 + 12

      # Wed 5:00 PM
      add_rule schedule,
               :wednesday,
               5 + 12

      # Thurs 12:00 PM
      add_rule schedule,
               :thursday,
               12

      # Thurs 3:00 PM
      add_rule schedule,
               :thursday,
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
