Rails.application.routes.draw do

  get "api/hosts_reserve" => "foreman_reserve/hosts#reserve"

end
