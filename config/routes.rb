Rails.application.routes.draw do
# root "welcome#index"

get "/" ,to:"welcome#index"
get "/resumes/new", to:"resumes#new", as: "new_resume"
get "/resumes", to:"resumes#index"
post"/resumes", to:"resumes#create"
post "/", to:"welcome#index" 

end
