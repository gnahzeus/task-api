Rails.application.routes.draw do
  scope '/api/version1' do
    resources :tasks
  end
  root :to => 'tasks#index'
end
