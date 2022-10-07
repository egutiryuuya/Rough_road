Rails.application.routes.draw do
  
 root to:"homes#top"
  get "home/about" =>"home#about"
  
  
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords],controllers: {
      sessions: "admin/sessions"
      
  }
  
  namespace :admin do
   resources :game_titles
  end
  
  scope module: :public do 
   resources :game_titles do
   resources :game_scores,only:[:index,:show,:create]
  end
   resources :game_scores do
   resources :reasons
  end

 
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
