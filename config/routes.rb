Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/company_top', to: 'home#company_top', as: 'company_top'
  get 'home/employee_top', to: 'home#employee_top', as: 'employee_top'

  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    sessions: 'companies/sessions'
  }
  resources :companies, only: [:show, :edit, :update, :destroy] do
    get "employee_management", to: "companies#employee_management", as: "employee_management"
    get "vehicle_management", to: "companies#vehicle_management", as: "vehicle_management"
    get "employee_management_show/:employee_id", to: "companies#employee_management_show", as: "employee_management_show"
    get "employee_management_attendance/:employee_id", to: "companies#employee_management_attendances", as: "employee_management_attendances"
    resources :projects
  end

  resources :vehicles, only: [:new, :create, :show, :edit, :update, :destroy]

  devise_for :employees, controllers: {
    registrations: 'employees/registrations',
    sessions: 'employees/sessions'
  }
  resources :employees, only: [:show, :edit] do 
    resources :projects, only: [:index, :show] do
      member do
        patch :start_project
        patch :complete_project
      end
    end
  end

  resources :attendances, only: [:create, :update, :index, :new, :show] do
    member do
      post 'clock_in', to: 'attendances#clock_in', as: 'clock_in'
      post 'clock_out', to: 'attendances#clock_out', as: 'clock_out'
    end
  end

end
