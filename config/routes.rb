Rails.application.routes.draw do
  articles = "articles"
  id = "id"
  index_page = "#{articles}#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root index_page
  get "/#{articles}", to: index_page
  get "/#{articles}/new", to: "#{articles}#new"
  get "/#{articles}/edit/:#{id}", to: "#{articles}#edit"
  get "/#{articles}/:#{id}", to: "#{articles}#show"
  post "/#{articles}", to: "#{articles}#create"
  patch "/#{articles}/:#{id}", to: "#{articles}#update"
  delete "/#{articles}/:#{id}", to: "#{articles}#destroy"
end
