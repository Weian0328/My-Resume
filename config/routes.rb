Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# root "welcome#index"
get "/" => "welcome#index"
get"/resumes/new", to:"resumes#new", as: "new_resume"
get "/resumes", to:"resumes#index"
end