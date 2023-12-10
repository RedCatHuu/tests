Rails.application.routes.draw do
  root to: 'homes#canvas'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get'homes/canvas' => 'homes#canvas'
  get'homes/top' => 'homes#top'
end
