require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '30s' do
	Rails.logger.info "Publications state checker task has started."

	#Deactivate active publications whose expiration date is today.
	deactivationHash = { }
	deactivationHash[:active] = true
    deactivationHash[:expiration_date] = Date.current..Date.current
	@publicationsToDeactivate = Publication.where(deactivationHash)
	@publicationsToDeactivate.all.each do |eachPublicationToDeactivate|
		eachPublicationToDeactivate.update_attribute(:active, false)
		Rails.logger.info "Publication #{eachPublicationToDeactivate.id} has been deactivated. Reason is: Expiration date (#{eachPublicationToDeactivate.expiration_date}) reached."
	end

	#Activate inactive publications whose publication date is today.
	activationHash = { }
	activationHash[:active] = false
	activationHash[:publication_date] = Date.current..Date.current
	@publicationsToActivate = Publication.where(activationHash)
	@publicationsToActivate.all.each do |eachPublicationToActivate|
		eachPublicationToActivate.update_attribute(:active, true)
		Rails.logger.info "Publication #{eachPublicationToActivate.id} has been activated. Reason is: Publication date (#{eachPublicationToActivate.publication_date}) reached."
	end

  	Rails.logger.info "Publications state checker task has finished."
end
