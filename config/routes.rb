Rails.application.routes.draw do
  root to: 'home#top'
  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    sessions: 'companies/sessions'
  }
  resources :companies, only: [:show, :edit]
  
  get 'home/company_top', to: 'home#company_top', as: 'company_top'
  get 'home/employee_top', to: 'home#employee_top', as: 'employee_top'
 
end
