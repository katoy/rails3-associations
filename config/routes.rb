Rails3Associations::Application.routes.draw do

  resources :comments
  resources :ideas

  root to: redirect('/ideas')

end
