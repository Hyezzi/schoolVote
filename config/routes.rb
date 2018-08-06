Rails.application.routes.draw do
  
  get '/hoowon2' => 'hoowon2#index'

  resources :hoowons
  get '/hoowons' => 'hoowon#index'
  get 'home/index'
  root 'vote_logs#index'

  #vote_logs routing
  resources :vote_logs
  resources :pledgenewees
  get 'home/index'
  post 'vote_logs/checkDouble' => 'vote_logs#checkDouble'

  #pledges routing
  get '/pledges' => 'pledges#index'
  

  #수영 routing
  get '/participate' => 'participate#index'
  get '/random' => 'lottos#new' 

  get 'home/quiz'     # 임시페이지
  get 'home/quizcard' # 임시페이지(블라인드공략테스트)
  resources :routers
  resources :voters
  resources :lottos
  devise_for :admins
  devise_for :users
  resources :pledgeintros

  get '/faq' => 'home#faq'
  get '/routers' => 'routers#index'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin' # merge할 때 제일 마지막줄에 위치하게 해주세요!!
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end





