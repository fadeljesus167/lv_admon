Rails.application.routes.draw do
  namespace :authentication, path: '/', as: '' do
    get '/sessions/new', as: :login
    post '/sessions/new', to: 'sessions#login'
    delete '/sessions/', to: 'sessions#destroy', as: :logout
  end

  get '/bills/index', as: :bills
  post '/bills/index', to: 'bills#create'
  get '/bills/new', as: :new_bill
  get '/bills/edit/:id', to: 'bills#edit', as: :bill
  patch '/bills/edit/:id', to: 'bills#update'
  get '/bills/new/:id', to: 'bills#generate', as: :generate_bill

  resources :fees
  resources :students

  get '/students/new/import', to: 'students#import_students', as: 'import_students'
  post '/students/new/import', to: 'students#create_csv'
  get '/verifications/payments', to: 'verifications#verification', as: 'payments_verify'
  post '/verification/payment/:id', to: 'verifications#verify', as: 'verify_payment'
  
  resources :payments
  get '/payments/:id/image', to: 'payments#get_image', as: :support_modal

  root "students#index"
end
