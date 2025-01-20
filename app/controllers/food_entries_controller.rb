require 'sinatra'

# Index
get '/food_entries' do
  @food_entries = FoodEntry.all
  erb :food_entries_index
end

# Show
get '/food_entries/:id' do
  @food_entry = FoodEntry.find(params[:id])
  erb :food_entry_show
end

# Create
get '/food_entries/new' do
  erb :food_entry_new
end

# Store
post '/food_entries' do
  @food_entry = FoodEntry.new(params[:food_entry])
  if @food_entry.save
    redirect '/food_entries'
  else
    erb :food_entry_new
  end
end

# Edit
get '/food_entries/:id/edit' do
  @food_entry = FoodEntry.find(params[:id])
  erb :food_entry_edit
end

# Update
put '/food_entries/:id' do
  @food_entry = FoodEntry.find(params[:id])
  if @food_entry.update(params[:food_entry])
    redirect "/food_entries/#{@food_entry.id}"
  else
    erb :food_entry_edit
  end
end

# Delete
delete '/food_entries/:id' do
  FoodEntry.find(params[:id]).destroy
  redirect '/food_entries'
end
