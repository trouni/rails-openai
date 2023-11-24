Rails.application.routes.draw do
  root to: "pages#home"

  resources :characters, only: %i[show create] do
    resources :illustrations, only: :create
  end
  resources :illustrations, only: :destroy

  require "sidekiq/web"
  # authenticate :user, ->(user) { user.admin? } do
  mount Sidekiq::Web => '/sidekiq'
  # end
end
