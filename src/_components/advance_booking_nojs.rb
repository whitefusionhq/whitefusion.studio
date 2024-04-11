class AdvanceBookingNojs < AdvanceBooking
  def template
    html -> { <<~HTML
      <select style="font: inherit" name="free_date_no_js">
        <option value="">#{text @placeholder}</option>
        #{ html_map free_dates do |date|
          <<~HTML
            <option value="#{text date.to_s, -> { tr " ", "_" }}">
              #{text date, -> { format_date }}
            </option>
          HTML
        end}
      </select>
    HTML
    }
  end
end
