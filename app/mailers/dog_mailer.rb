class DogMailer < ActionMailer::Base
  default from: "Canine Connector"

  def dog_alert(dog, current_user)
    @dog = dog
    @current_user = current_user

    mail to: dog.user.email, subject: "Dog Alert!"
  end
end
