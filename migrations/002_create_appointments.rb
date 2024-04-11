Sequel.migration do
  change do
    create_table(:appointments) do
      primary_key :id
      DateTime :created_at
      DateTime :updated_at

      DateTime :appointment_time
      String :purpose
      foreign_key :user_id, :users, type: :Bignum
    end
  end
end
