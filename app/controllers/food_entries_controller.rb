require 'sinatra'
require './app'

# Index
get '/food_entries' do
  if logged_in?(session)
    user_entries = current_user(session).food_entries.order(created_at: :asc)
    public_entries = FoodEntry.where(public: true).order(created_at: :asc)
    @food_entries = (user_entries + public_entries).uniq
    erb :'food_entries/index'
  else
    redirect '/login'
  end
end

# Create
get '/food_entries/new' do
  @food_entries = FoodEntry.new
  erb :'food_entries/new'
end

# Store
post '/food_entries' do
  if params[:food_entry][:image] && params[:food_entry][:image][:tempfile]
    begin
      # File upload on Cloudinary
      upload = Cloudinary::Uploader.upload(params[:food_entry][:image][:tempfile], folder: 'food_entries')

      # Add the image URL from Cloudinary in params
      params[:food_entry][:image] = upload['secure_url']
    rescue StandardError => e
      return "Erreur d'upload Cloudinary : #{e.message}"
    end
  else
    params[:food_entry].delete(:image)
  end

  food_entry = current_user(session).food_entries.new(
    params[:food_entry]
  )

  if food_entry.save
    redirect '/food_entries'
  else
    @error = "Erreur lors de l'enregistrement de l'aliment : #{food_entry.errors.full_messages.join(', ')}"
    erb :'food_entries/new'
  end
end

# Show
get '/food_entries/:id' do
  @food_entry = FoodEntry.find(params[:id])
  erb :'food_entries/show'
end

# Edit
get '/food_entries/:id/edit' do
  @food_entry = FoodEntry.find(params[:id])
  erb :'food_entries/edit'
end

# Update
put '/food_entries/:id' do
  if params[:food_entry][:image] && params[:food_entry][:image][:tempfile]
    begin
      # File upload on Cloudinary
      upload = Cloudinary::Uploader.upload(params[:food_entry][:image][:tempfile], folder: 'food_entries')

      # Add the image URL from Cloudinary in params
      params[:food_entry][:image] = upload['secure_url']
    rescue StandardError => e
      return "Erreur d'upload Cloudinary : #{e.message}"
    end
  else
    params[:food_entry].delete(:image)
  end

  @food_entry = FoodEntry.find(params[:id])

  if @food_entry.update(params[:food_entry])
    redirect "/food_entries/#{@food_entry.id}"
  else
    @error = "Erreur lors de la modification de l'aliment : #{@food_entry.errors.full_messages.join(', ')}"
    erb :'food_entries/edit'
  end
end

# Delete
delete '/food_entries/:id' do
  FoodEntry.find(params[:id]).destroy
  redirect '/food_entries'
end
