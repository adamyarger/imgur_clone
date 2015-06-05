Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'static_pages#root'
end
