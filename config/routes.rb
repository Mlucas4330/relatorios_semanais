Rails.application.routes.draw do
  devise_for :users
  resources :tickets, only: [:index, :new, :edit, :update, :create]
  root "tickets#index"
  get "tickets/:id/destroy", to: "tickets#destroy", as: :destroy_ticket
  get "tickets/generate_pdf", to: "tickets#generate_pdf", as: :generate_pdf
end
