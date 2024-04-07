class User < Sequel::Model
  one_to_many :appointments
end

# Table: users
# ---------------------------------------------------------------------------------------------------
# Columns:
#  id            | bigint                      | PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY
#  email         | citext                      | NOT NULL
#  name          | text                        |
#  password_hash | text                        | NOT NULL
#  created_at    | timestamp without time zone |
#  updated_at    | timestamp without time zone |
# Indexes:
#  users_pkey        | PRIMARY KEY btree (id)
#  users_email_index | UNIQUE btree (email)
# Check constraints:
#  valid_email | (email ~ '^[^,;@ \r\n]+@[^,@; \r\n]+\.[^,@; \r\n]+$'::citext)
# Referenced By:
#  account_password_reset_keys | account_password_reset_keys_id_fkey | (id) REFERENCES users(id)
#  account_remember_keys       | account_remember_keys_id_fkey       | (id) REFERENCES users(id)
#  appointments                | appointments_user_id_fkey           | (user_id) REFERENCES users(id)
# ---------------------------------------------------------------------------------------------------