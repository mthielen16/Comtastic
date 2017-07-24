Rails.application.routes.draw do



  #resources :charts, only: [] do
    #collection do
     # get 'testing'
      #get 'home'
      #get 'index'

     # end
  #end

  root 'statistics#home'

  #get 'home' => 'statistics#home', as: 'home'
  get 'show' => 'statistics#show'

end
