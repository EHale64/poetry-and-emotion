Rails.application.routes.draw do
  get 'search/index'
  root 'welcome#index'
  get '/search', to: 'search#index'
end
