json.extract! attachment, :id, :file, :user_id, :created_at, :updated_at
json.url attachment_url(attachment, format: :json)
