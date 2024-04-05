class AdvanceBookingNojs < AdvanceBooking
  def template
    html -> { <<~HTML
      <select style="font: inherit" name="free_date_no_js">
        <option value="">#{text @placeholder}</option>
        #{ html_map free_dates do |date|
          html -> { <<~HTML
            <option value="#{text(-> { date.to_s }.pipe { tr(" ", "_") })}">
              #{text(-> { date }.pipe { format_date })}
            </option>
          HTML
          }
        end}
      </select>
    HTML
    }
  end

  def format_date(date)
    date.strftime date_display_format
  end
end
