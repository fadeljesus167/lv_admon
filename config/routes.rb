Rails.application.routes.draw do
  get 'bills/index', as: :bills
  post 'bills/index', to: 'bills#create'
  get 'bills/new', as: :new_bill
  get 'bills/show', as: :bill
  get 'bills/new/:id', to: 'bills#generate', as: :generate_bill

  resources :students
  get '/students/new/import', to: 'students#import_students', as: 'import_students'
  post '/students/new/import', to: 'students#create_csv'
  get '/verifications/payments', to: 'verifications#verification', as: 'payments_verify'
  post '/verification/payment/:id', to: 'verifications#verify', as: 'verify_payment'
  resources :payments

  root "students#index"
end
