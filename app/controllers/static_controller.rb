class StaticController < ApplicationController
  skip_before_action :authenticate_user!

  def about_page
  end

  # def landing_page
  # end

  def dev_page
  end

  def privacy_page
  end

  def help_page
  end

  def terms_page
  end

  def contact_page
  end

  def home_page
  end
end
