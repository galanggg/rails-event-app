Rails
  .application
  .routes
  .draw do
    root 'events#index'

    get 'upcoming', to: 'events#upcoming', as: 'upcoming_event'
    get 'past', to: 'events#past', as: 'past_event'

    resources :events do
      resources :registrations
    end

    # get "events", to: "events#index"
    # get "events/new/", to: "events#new", as: "new_event"
    # get "events/:id", to: "events#show", as: "event"
    # get "events/:id/edit",to: "events#edit", as: "edit_event"
    # patch "events/:id", to: "events#update", as: "update_event"

    resource :session, only: %i[new create destroy]

    resources :users
    get 'signup' => 'users#new'
  end
