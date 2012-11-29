module ForemanReserve
	module HostExtensions
	    def self.included(base)
	        base.send :include, InstanceMethods
	    end

	    module InstanceMethods
			def reserve!
			    param = "RESERVED"
			    if p=host_parameters.find_by_name(param)
			      p.update_attribute(:value, "true")
			    else
			      host_parameters.create!(:name => param, :value => "true")
			    end
			end

			def as_json(options={})
				super(:methods => [:host_parameters])
		    end
		end
	end
end
