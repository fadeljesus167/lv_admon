Rails.application.routes.draw do
  resources :students
  get '/students/new/import', to: 'students#import_students', as: 'import_students'
  post '/students/new/import', to: 'students#create_csv'
  resources :payments
  post '/payments/:id/verify', to: 'payments#verify', as: 'payment_verify'

  root "students#index"
end
