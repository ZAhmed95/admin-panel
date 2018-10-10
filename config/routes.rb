Rails.application.routes.draw do
  # root
  root 'main#index', as: 'main'
  # session
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  # courses
  get 'courses', to: 'courses#index', as: 'courses'
  get 'courses/new', to: 'courses#new', as: 'new_course'
  post 'courses', to: 'courses#create'
  get 'courses/:id', to: 'courses#show', as: 'course', id: /\d+/
  get 'courses/:id/edit', to: 'courses#edit', as: 'edit_course', id: /\d+/
  patch 'courses/:id', to: 'courses#update', id: /\d+/
  delete 'courses/:id', to: 'courses#destroy', as: 'delete_course', id: /\d+/
end
