class RegistrationsController < Devise::RegistrationsController

  def create
    
    if simple_captcha_valid?
      super
    else      
      build_resource
      resource.valid?
      resource.errors.add(:base, "There was an error with the recaptcha code below. Please re-enter the code.")
      clean_up_passwords(resource)
      respond_with_navigational(resource) { render :new }
    end
  end


end