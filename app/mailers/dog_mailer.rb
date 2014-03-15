class DogMailer < ActionMailer::Base
  default from: "Canine Connector"

  def dog_alert(dog, current_user)
    @dog = dog
    @current_user = current_user
    @space = " "

    if current_user.phone == ""
      @current_user_phone = ""
    else
      @current_user_phone = "Phone #: #{current_user.phone}"
    end

    if dog.is_lost?
      @plug = "have found your dog!"
    elsif dog.is_found?
      @plug = "be the owner!"
    end

    mail to: dog.user.email, subject: "Dog Alert! - Regarding #{@dog.name}"
  end
end
