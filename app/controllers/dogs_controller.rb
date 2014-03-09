class DogsController < InheritedResources::Base

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

  private

  def dog_params
    params.require(:dog).permit(
      :name,
      :responds_to,
      :breed,
      :age,
      :features,
      :unique_features,
      :is_lost,
      :is_found,
      :date_found,
      :location,
      :user_id)
  end

end
