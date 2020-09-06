Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    jsonapi_resources :packs
    jsonapi_resources :identities
    jsonapi_resources :scenarios
    jsonapi_resources :modular_encounter_sets
  end
end
