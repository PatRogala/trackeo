Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks, only: [:index]
  put "tasks/:id/toggle", to: "tasks#toggle", as: :toggle_task
end
