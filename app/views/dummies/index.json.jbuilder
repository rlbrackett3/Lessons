json.array!(@dummies) do |dummy|
  json.extract! dummy, :id, :foobar
  json.url dummy_url(dummy, format: :json)
end
