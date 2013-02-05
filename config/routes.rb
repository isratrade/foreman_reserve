Rails.application.routes.draw do

  get "api/hosts_reserve" => "foreman_reserve/hosts#reserve"
  get "api/hosts_release" => "foreman_reserve/hosts#release"
  get "api/show_released" => "foreman_reserve/hosts#show_released"
  get "api/show_reserved" => "foreman_reserve/hosts#show_reserved"
  get "api/update_reserved_reason" => "foreman_reserve/hosts#update_reason"

end
