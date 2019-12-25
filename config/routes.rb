Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get 'recipe/:id/profile/:id', to: 'recipes#profile' ,as: "recipe_profile"
  resources :recipes do
    resources :questions 
   end
resources :questions do
  resources :answers
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
