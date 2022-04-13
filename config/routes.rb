Rails.application.routes.draw do

resources :resumes

resource :users, only: [:create] do
  get :sign_up
  get :sign_in
end

resources :sessions, only: [:create, :destroy]

# get"/users/sign_up", to: "users#new"


post "/", to:"welcome#index" 


# get "/" ,to:"resumes#index"
root "resumes#index"
end
