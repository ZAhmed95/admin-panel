Rails.application.routes.draw do
  get 'students/index'
  get 'students/show'
  get 'students/edit'
  get 'students/update'
  get 'students/new'
  get 'students/create'
  get 'students/destroy'
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
  # cohorts
  get 'cohorts', to: 'cohorts#index', as: 'cohorts'
  post 'cohorts', to: 'cohorts#create'
  get 'cohorts/:id', to: 'cohorts#show', as: 'cohort', id: /\d+/
  get 'cohorts/:id/edit', to: 'cohorts#edit', as: 'edit_cohort', id: /\d+/
  patch 'cohorts/:id', to: 'cohorts#update', id: /\d+/
  delete 'cohorts/:id', to: 'cohorts#destroy', as: 'delete_cohort', id: /\d+/
  # cohorts in courses
  get 'courses/:id/cohorts', to: 'course_cohorts#index', as: 'cohorts_in_course', id: /\d+/
  get 'courses/:id/cohorts/new', to: 'course_cohorts#new', as: 'new_cohort_in_course', id: /\d+/
  post 'courses/:id/cohorts', to: 'course_cohorts#create', id: /\d+/
end
