Rails.application.routes.draw do
  namespace :admin do
    resources :customers, only:[:index,:update,:edit]
  end
 root to:"homes#top"
  get "home/about" =>"home#about"
  
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  
  
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
    resources :customers,only:[:edit,:update,:index,:show] do
     resources :favorites,only:[:index]
    end
    
    
    # 退会確認画面
    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
  
    patch '/customers/:id/withdrawal' => 'customrs#withdrawal', as: 'withdrawal'
    
    resources :game_titles do
     resources :game_scores,only:[:index,:show,:create]
    end
    resources :game_scores do
     resources :reasons
     
     resource :favorites,only:[:create,:destroy,:index]
    get "/reasons/new/lose" =>"reasons#lose" ,as: "lose_reason"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
