Rails.application.routes.draw do
  devise_for :users
  resources :customers

  # Database backup/restore (requires authentication)
  get "backup", to: "backups#index", as: :backup
  get "backup/export", to: "backups#export", as: :backup_export
  post "backup/import", to: "backups#import", as: :backup_import
  get "backup/download_daily", to: "backups#download_daily", as: :backup_download_daily

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "customers#index"
end
