json.array!(@charges) do |charge|
  json.extract! charge, :id, :customer, :amount, :description, :currency
  json.url charge_url(charge, format: :json)
end
