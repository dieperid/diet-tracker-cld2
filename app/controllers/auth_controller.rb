# frozen_string_literal: true

require 'bcrypt'
require 'valid_email'

# Page de connexion
get '/login' do
  erb :'login/index'
end

# Soumission du formulaire de connexion
post '/login' do
  if check_login(params[:email], params[:password], session)
    redirect '/'
  else
    redirect '/login'
  end
end

# Page d'inscription
get '/register' do
  erb :'register/index'
end

# Soumission du formulaire d'inscription
post '/register' do
  if register_user(params[:name], params[:email], params[:password], session)
    redirect '/login'
  else
    redirect '/register'
  end
end

# Déconnexion
get '/logout' do
  session.clear
  redirect '/login'
end

##############################

# Méthode pour enregistrer un utilisateur
def register_user(name, email, password, session)
  unless ValidateEmail.valid?(email)
    session[:error] = 'Adresse email invalide.'
    return false
  end

  if User.find_by(email: email)
    session[:error] = 'Cet email est déjà utilisé.'
    return false
  end

  current_date = Time.now.strftime('%Y-%m-%d %H:%M')

  User.create(
    name: name,
    email: email,
    password_digest: BCrypt::Password.create(password),
    created_at: current_date,
    updated_at: current_date
  )
end

# Méthode pour vérifier les identifiants de connexion
def check_login(email, password, session)
  user = User.find_by(email: email)

  if user && BCrypt::Password.new(user.password_digest) == password
    session[:user_id] = user.id
    true
  else
    session[:error] = 'Email ou mot de passe incorrect.'
    false
  end
end
