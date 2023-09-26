json.extract! user, :id, :email, :first_name, :last_name, :password, :img_avatar_name, :about_myself, :created_at, :updated_at
json.url user_url(user, format: :json)
