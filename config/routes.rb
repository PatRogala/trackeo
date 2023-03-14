Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks, only: [:index, :new, :create]
  put "tasks/:id/toggle", to: "tasks#toggle", as: :toggle_task
end
