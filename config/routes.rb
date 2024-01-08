Rails.application.routes.draw do
  devise_for :users #(デバイスに必要なアクションが全部入ってる！)
  root to: 'items#index' #(ルートにアクセスするとindexアクションに行く)
  resources :items 
end
