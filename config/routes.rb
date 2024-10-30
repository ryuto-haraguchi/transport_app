Rails.application.routes.draw do
  get 'employees/show'
  get 'employees/edit'
  root to: 'home#top'
  get 'home/company_top', to: 'home#company_top', as: 'company_top'
  get 'home/employee_top', to: 'home#employee_top', as: 'employee_top'

  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    sessions: 'companies/sessions'
  }
  resources :companies, only: [:show, :edit]

  devise_for :employees, controllers: {
    registrations: 'employees/registrations',
    sessions: 'employees/sessions'
  }
  resources :employees, only: [:show, :edit]
  
  
 
end
