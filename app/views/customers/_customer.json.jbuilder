json.extract! customer, :id, :account_id, :first_name, :last_name, :email, :phone_number, :created_at, :updated_at
json.url customer_url(customer, format: :json)
