class RegistrationsController < Devise::RegistrationsController
  def destroy
    if current_user.destroy
      current_user.publications.each do |publication|
         publication.retire
         publication.save
      end
      redirect_to root_url, notice: "El usuario ha sido eliminado."
    end
  end
end