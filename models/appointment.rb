class Appointment < Sequel::Model
  many_to_one :user

  def display_purpose
    case purpose # rubocop:disable Style/HashLikeCase
    when "free"
      "free 30 min"
    when "hour"
      "2 hours"
    when "morning"
      "4-6 hours"
    end
  end
end

# Table: appointments
# ----------------------------------------------------------------------------------------------
# Columns:
#  id               | integer                     | PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY
#  created_at       | timestamp without time zone |
#  updated_at       | timestamp without time zone |
#  appointment_time | timestamp without time zone |
#  purpose          | text                        |
#  user_id          | bigint                      |
# Indexes:
#  appointments_pkey | PRIMARY KEY btree (id)
# Foreign key constraints:
#  appointments_user_id_fkey | (user_id) REFERENCES users(id)
# ----------------------------------------------------------------------------------------------
