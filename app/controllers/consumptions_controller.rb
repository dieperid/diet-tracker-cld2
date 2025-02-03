require 'sinatra'
require './app'

# Index
get '/consumptions' do
  if logged_in?(session)
    @consumptions = current_user(session).consumptions
                                         .includes(:food_entry)
                                         .order(consumption_date: :asc)

    @calories_per_day = @consumptions.group(:consumption_date)
                                     .sum('food_entries.calories * consumptions.quantity')

    erb :'consumptions/index'
  else
    redirect '/login'
  end
end

# Create
get '/consumptions/new' do
  @consumption = Consumption.new
  erb :'consumptions/new'
end

# Store
post '/consumptions' do
  consumption = current_user(session).consumptions.new(
    params[:consumption]
  )

  if consumption.save
    redirect '/consumptions'
  else
    @error = "Erreur lors de l'enregistrement de la consommation."
    erb :'consumptions/new'
  end
end

# Show
get '/consumptions/:id' do
  @consumption = Consumption.find(params[:id])
  erb :'consumptions/show'
end

# Edit
get '/consumptions/:id/edit' do
  @consumption = Consumption.find(params[:id])
  erb :'consumptions/edit'
end

# Update
put '/consumptions/:id' do
  @consumption = Consumption.find(params[:id])
  if @consumption.update(params[:consumption])
    redirect "/consumptions/#{@consumption.id}"
  else
    erb :'consumptions/edit'
  end
end

# Delete
delete '/consumptions/:id' do
  Consumption.find(params[:id]).destroy
  redirect '/consumptions'
end
