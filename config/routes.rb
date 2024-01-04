#まえのやつ！

Rails.application.routes.draw do
  root to: "items#index" #(ルートにアクセスするとindexアクションに行く)
  resources :items 
end
