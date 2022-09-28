Rails.application.routes.draw do
  resource :currencies, only: :show do
    get :live, :list
  end
end
