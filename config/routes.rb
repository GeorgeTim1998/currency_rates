Rails.application.routes.draw do
  root 'currencies#show'

  resource :currencies, only: :show do
    get :live, :list
  end
end
