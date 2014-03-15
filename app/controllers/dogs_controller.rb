class DogsController < InheritedResources::Base
  before_action :set_item, only: [:show, :update]
  # before_action :authenticate_user!

  def search
    @dogs = Dog.text_search(params[:query]).order("created_at DESC").page(params[:page]).per(8)
    # if params[:search].present?
    #   @dogs = DogSearch.new(query: params[:search]).results
    # else
    #   @dogs = Dog.all
    # end
  end

  def all_found
    @dogs = Dog.where(is_found: true).where(has_returned: [nil, false]).order("created_at DESC").page(params[:page]).per(8)
  end

  def all_lost
    @dogs = Dog.where(is_lost: true).where(has_returned: [nil, false]).order("created_at DESC").page(params[:page]).per(8)
  end

  def send_dog_alert
    @dog = Dog.find(params[:id])

    number_to_send_to = @dog.user.phone
    current_user_username = current_user.user_name
    current_user_email = current_user.email
    current_user_phone = current_user.phone
    dog_name = @dog.name
    if current_user.phone != ""
      text_end = " or #{current_user_phone}."
    else
      text_end = "."
    end

    twilio_sid = ENV["TWILIO_SID"]
    twilio_token = ENV["TWILIO_TOKEN"]
    twilio_phone_number = ENV["TWILIO_PHONE_NUMBER"]

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "Canine Connector user #{current_user_username} has info about #{dog_name}! Reach them at: #{current_user_email}" + "#{text_end}")

    DogMailer.dog_alert(@dog, current_user).deliver
    # render :nothing => true
    flash[:notice] = "#{@dog.user.user_name} has been notified and will get back to you shortly!"
    redirect_to root_path
  end

    # def send_email(dog)
  #   @dog = Dog.find(params[:id])
  #   DogMailer.dog_alert(@dog, current_user).deliver
  #   render :nothing => true
  # end

  def create
    @dog = current_user.dogs.new(dog_params)
    # @dog = Dog.new(dog_params)
    if @dog.save
      flash[:notice] = "Your dog has been posted!"
      redirect_to dogs_path
    else
      flash[:alert] = "Your dog couldn't be posted. #{@dog.errors.full_messages.join(" ")}"
      render :index
    end
  end

  def update
    @dog.update(dog_params)
    redirect_to @dog
  end

  private

  def set_item
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(
      :name,
      :responds_to,
      :breed,
      :age,
      :picture,
      :features,
      :main_color,
      :secondary_colors,
      :unique_features,
      :has_returned,
      :is_lost,
      :is_found,
      :date_found,
      :date_lost,
      :location,
      :id,
      :user_id,
      :gender)
  end

end
