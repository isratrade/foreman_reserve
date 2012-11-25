Rails.application.routes.draw do

  get "reserve" => "foreman_reserve/hosts#reserve" , :as => :hosts_reserve_page

end
