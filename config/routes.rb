Rails.application.routes.draw do
  root to: 'homes#canvas'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get'homes/canvas' => 'homes#canvas'
  get'homes/top' => 'homes#top'
  get'homes/advansed' => 'homes#advansed'
  get'homes/image' => 'homes#image'
  get'homes/head' => 'homes#head'
  get'homes/magick'
  get'homes/index'
  
  resources :post_images, only:[:create, :index, :show]
  resources :users, only:[:create, :index, :show]
end
