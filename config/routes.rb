Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#index"
    
  resources :users, only: [:index, :new, :create] do
    collection do
      get 'step1'   #予約日時登録
      get 'step2'   #名前（漢字・カナ）・生年月日・電話番号・メールアドレス登録
      get 'confirm' #確認画面、確定ボタンでcreateが走る
    
    # 変更点
      # get :step1
      # post :step2
      # post :confirm
    # 変更点
    end
  end
end
