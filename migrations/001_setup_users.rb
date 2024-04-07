Sequel.migration do
  up do
    run "CREATE EXTENSION IF NOT EXISTS citext"
    extension :date_arithmetic

    create_table(:users) do
      primary_key :id, type: :Bignum
      citext :email, null: false
      constraint :valid_email, email: %r{^[^,;@ \r\n]+@[^,@; \r\n]+\.[^,@; \r\n]+$}
      String :name
      String :password_hash, null: false
      index :email, unique: true

      DateTime :created_at
      DateTime :updated_at
    end

    # Used by the remember me feature
    create_table(:account_remember_keys) do
      foreign_key :id, :users, primary_key: true, type: :Bignum
      String :key, null: false
      DateTime :deadline,
               { null: false, default: Sequel.date_add(Sequel::CURRENT_TIMESTAMP, days: 30) }
    end

    create_table(:account_password_reset_keys) do
      foreign_key :id, :users, primary_key: true, type: :Bignum
      String :key, null: false
      DateTime :deadline,
               { null: false, default: Sequel.date_add(Sequel::CURRENT_TIMESTAMP, days: 1) }
      DateTime :email_last_sent, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end

  def down
    # not really sure why this didn't seem to be working
    drop_table :account_password_reset_keys, :account_remember_keys, :user
  end
end
