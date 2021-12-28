Rails.application.routes.draw do
  scope '/api/version1' do
    resources :tasks
  end
  get "/", to: "tasks#index"
  root to: 'tasks#index'
end
