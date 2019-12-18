Rails.application.routes.draw do
  namespace :v1 do
    resources :articles
  end
end
