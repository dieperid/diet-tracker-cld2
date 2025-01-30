require 'sinatra'
require './app'

# Index
get '/weights' do
  if logged_in?(session)
    @weights = current_user(session).weights.order(date: :asc)
    erb :'weights/index'
  else
    redirect '/login'
  end
end

# Create
get '/weights/new' do
  @weight = Weight.new
  erb :'weights/new'
end

# Store
post '/weights' do
  weight = current_user(session).weights.new(
    params
  )

  if weight.save
    redirect '/weights'
  else
    @error = "Erreur lors de l'enregistrement du poids."
    erb :'weights/new'
  end
end

# Show
get '/weights/:id' do
  @weight = Weight.find(params[:id])
  erb :'weights/show'
end

# Edit
get '/weights/:id/edit' do
  @weight = Weight.find(params[:id])
  erb :'weights/edit'
end

# Update
put '/weights/:id' do
  @weight = Weight.find(params[:id])
  if @weight.update(params[:weight])
    redirect "/weights/#{@weight.id}"
  else
    erb :'weights/edit'
  end
end

# Delete
delete '/weights/:id' do
  Weight.find(params[:id]).destroy
  redirect '/weights'
end
