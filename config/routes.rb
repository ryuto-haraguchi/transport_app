Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/company_top', to: 'home#company_top', as: 'company_top'
  get 'home/employee_top', to: 'home#employee_top', as: 'employee_top'

  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    sessions: 'companies/sessions'
  }
  resources :companies, only: [:show, :edit] do
    get "employee_management", to: "companies#employee_management", as: "employee_management"
    get "vehicle_management", to: "companies#vehicle_management", as: "vehicle_management"
    resources :vehicles, only: [:new, :create, :show, :edit, :update, :destroy]
  end

  devise_for :employees, controllers: {
    registrations: 'employees/registrations',
    sessions: 'employees/sessions'
  }
  resources :employees, only: [:show, :edit]
  
  
 
end
