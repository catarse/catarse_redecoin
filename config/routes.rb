CatarseRedecoin::Engine.routes.draw do
  resources :redecoin, only: [], path: "payment/redecoin" do

    member do
      post :pay, to: 'redecoin#create'
    end

  end
end
