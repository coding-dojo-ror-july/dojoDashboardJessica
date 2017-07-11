Rails.application.routes.draw do
  root "dojo#index"
  get "dojos/new" => "dojo#new"
  post "dojos/create" => "dojo#create"
end
