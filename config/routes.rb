Rails.application.routes.draw do
  scope '/api/version1' do
    resources :tasks
  end
  # global options responder -> makes sure OPTION request for CORS endpoints work
  match '*path', via: [:options], to: lambda {|_| [204, { 'Content-Type' => 'text/plain' }]}
  get "/", to: "tasks#index"
  root to: 'tasks#index'
end
