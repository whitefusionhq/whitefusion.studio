class AdvanceBooking < Bridgetown::Component
  def initialize(blocked_dates:)
    @blocked_dates = blocked_dates
  end
end
