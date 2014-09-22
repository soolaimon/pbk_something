Rails.application.routes.draw do
  root 'password#index'
  post '/authenticate' => 'password#authenticate'
end
