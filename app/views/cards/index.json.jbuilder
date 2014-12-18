json.array!(@cards) do |card|
  json.extract! card, :id, :user_id, :type, :cc_number, :cc_code, :cc_name, :cc_date
  json.url card_url(card, format: :json)
end
