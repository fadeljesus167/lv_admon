Rails.application.routes.draw do
  resources :students
  get '/students/new/import', to: 'students#import_students', as: 'import_students'
  post '/students/new/import', to: 'students#create_csv'
  get '/verify/payments', to: 'payments#verification', as: 'payments_verify'
  post '/verify/payment/:id', to: 'payments#verify', as: 'verify_payment'
  resources :payments

  root "students#index"
end
