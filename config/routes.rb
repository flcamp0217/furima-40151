#まえのやつ！

Rails.application.routes.draw do
  devise_for :users
  root to: "items#index" #(ルートにアクセスするとindexアクションに行く)
  resources :items 
end
