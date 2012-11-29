module ForemanReserve
  class HostsController < ::HostsController

    unloadable

    def reserve

      unless api_request?
        error "This operation is only valid via an API request"
        #"TODO redirect_back_or_to(main_app.root_path) "
        redirect_to('/')  and return
      end

      my_hosts        = User.current.admin? ? Host : Host.my_hosts
      amount          = (params[:amount] || 1).to_i
      potential_hosts = my_hosts.search_for(params[:query])

      return not_found if potential_hosts.empty?

      return not_acceptable if potential_hosts.count < amount

      @hosts = potential_hosts[0..(amount-1)].each { |host| host.reserve! }
      respond_to do |format|
        format.json {render :json => @hosts.map(&:name) }
        format.yaml {render :text => @hosts.to_yaml}
        format.html {not_found }

      end

    end

    def not_acceptable
	     head :status => 406
    end

 end
end
