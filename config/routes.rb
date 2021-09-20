Rails.application.routes.draw do
  resources :courses do
    resources :tutors
  end

  resources :students do
    resources :courses
  end
  
  resources :tutors 
end
