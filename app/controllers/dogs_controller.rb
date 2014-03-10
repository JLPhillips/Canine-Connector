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

  def update
    # @dog = current_user.dogs.update(dog_params)
  end

  private

  def dog_params
    params.require(:dog).permit(
      :name,
      :responds_to,
      :breed,
      :age,
      :picture,
      :features,
      :unique_features,
      :is_lost,
      :is_found,
      :date_found,
      :date_lost,
      :location,
      :id,
      :user_id,)
  end

end
