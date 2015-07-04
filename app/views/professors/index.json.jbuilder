json.array!(@professors) do |professor|
  json.extract! professor, :id, :name, :title, :department, :link
  json.url professor_url(professor, format: :json)
end
