Rails.application.routes.draw do

  get "api/hosts_reserve" => "foreman_reserve/hosts#reserve"
  get "api/hosts_release" => "foreman_reserve/hosts#release"

end
