require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '5m' do
	#Deactivate active publications whose expiration date is today.
	deactivationHash = { }
	deactivationHash[:active] = true
    deactivationHash[:expiration_date] = Date.today..Date.today
	@publicationsToDeactivate = Publication.where(deactivationHash)
	@publicationsToDeactivate.all.each do |eachPublicationToDeactivate|
		eachPublicationToDeactivate.update_attribute(:active, false)
		Rails.logger.info "Publication #{eachPublicationToDeactivate.id} has been deactivated. Reason is: Expiration date (#{eachPublicationToDeactivate.expiration_date}) reached."
	end

	#Activate inactive publications whose publication date is today.
	activationHash = { }
	activationHash[:active] = false
	activationHash[:paid] = true
	activationHash[:publication_date] = Date.today..Date.today
	activationHash[:remaining_days] = 0
	@publicationsToActivate = Publication.where(activationHash)
	@publicationsToActivate.all.each do |eachPublicationToActivate|
		eachPublicationToActivate.update_attribute(:active, true)
		Rails.logger.info "Publication #{eachPublicationToActivate.id} has been activated. Reason is: Publication date (#{eachPublicationToActivate.publication_date}) reached."
	end

end
