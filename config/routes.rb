Rails.application.routes.draw do

resources :resumes

get"/users/sign_up", to: "users#new"





get "/" ,to:"resumes#index"
# root "resumes#index"

post "/", to:"welcome#index" 

end
