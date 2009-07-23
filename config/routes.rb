ActionController::Routing::Routes.draw do |map|
  map.resources :registrations, :controller => 'prison/registrations', :only => %w(new create) do |registration|
    registration.resources :confirmations, :controller => 'prison/confirmations'
  end
  map.resource :session, :controller => 'prison/session', :only => %w(new create destroy)
end
