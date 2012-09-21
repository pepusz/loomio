Rails.application.routes.draw do
  get "home/index"

  root to: 'home#index'


  mount BushTelegraph::Engine => "/bush_telegraph"
end
