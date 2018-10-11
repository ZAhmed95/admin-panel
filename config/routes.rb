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
  # students
  get 'students', to: 'students#index', as: 'students'
  get 'students/new', to: 'students#new', as: 'new_student'
  post 'students', to: 'students#create'
  get 'students/:id', to: 'students#show', as: 'student', id: /\d+/
  get 'students/:id/edit', to: 'students#edit', as: 'edit_student', id: /\d+/
  patch 'students/:id', to: 'students#update', id: /\d+/
  delete 'students/:id', to: 'students#destroy', as: 'delete_student', id: /\d+/
  # students in cohorts
  get 'cohorts/:id/students', to: 'cohort_students#index', as: 'students_in_cohort', id: /\d+/
  get 'cohorts/:id/students/new', to: 'cohort_students#new', as: 'new_students_in_cohort', id: /\d+/
  post 'cohorts/:id/students', to: 'cohort_students#create', id: /\d+/
  # instructors
  get 'instructors', to: 'instructors#index', as: 'instructors'
  get 'instructors/new', to: 'instructors#new', as: 'new_instructor'
  post 'instructors', to: 'instructors#create'
  get 'instructors/:id', to: 'instructors#show', as: 'instructor', id: /\d+/
  get 'instructors/:id/edit', to: 'instructors#edit', as: 'edit_instructor', id: /\d+/
  patch 'instructors/:id', to: 'instructors#update', id: /\d+/
  delete 'instructors/:id', to: 'instructors#destroy', as: 'delete_instructor', id: /\d+/
end
