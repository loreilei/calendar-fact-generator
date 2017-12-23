Rails.application.routes.draw do
  get 'xkcd1930/calendar'

  root 'xkcd1930#calendar'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
