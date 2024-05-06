Sequel.migration do
  change do
    add_column :users, :stripe_customer_id, String
  end
end
