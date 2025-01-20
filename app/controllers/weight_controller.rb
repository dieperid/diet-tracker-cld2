require 'sinatra'
require 'sinatra/activerecord'

# Index
get '/weights' do
  @weights = Weight.all
  erb :'weights/index'
end

# Show
get '/weights/:id' do
  @weight = Weight.find(params[:id])
  erb :'weights/show'
end

# Create
get '/weights/new' do
  erb :'weights/new'
end

# Store
post '/weights' do
  @weight = Weight.new(params[:weight])
  if @weight.save
    redirect '/weights'
  else
    erb :'weights/new'
  end
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
