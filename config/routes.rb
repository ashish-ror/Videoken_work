Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/tag/:entity_type/:entity_id/:tags', controller: 'entries', action: 'create_tag', defaults: {format: :json} , via: [:post]
  match '/tag/:entity_type/:entity_id/', controller: 'entries', action: 'retrieve_tag', defaults: {format: :json} , via: [:get]
  match '/tag/:entity_type/:entity_id/', controller: 'entries', action: 'delete_tag', defaults: {format: :json} , via: [:delete]
  match '/stats', controller: 'entries', action: 'stats', defaults: {format: :json} , via: [:get]
  match '/stats/:entity_type/:entity_id/', controller: 'entries', action: 'retrieve_stat', defaults: {format: :json} , via: [:get]
end
