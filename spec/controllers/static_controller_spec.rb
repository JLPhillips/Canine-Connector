require 'spec_helper'

describe StaticController do

  describe "GET 'about_page'" do
    it "returns http success" do
      get 'about_page'
      response.should be_success
    end
  end

  describe "GET 'landing_page'" do
    it "returns http success" do
      get 'landing_page'
      response.should be_success
    end
  end

  describe "GET 'dev_page'" do
    it "returns http success" do
      get 'dev_page'
      response.should be_success
    end
  end

  describe "GET 'privacy_page'" do
    it "returns http success" do
      get 'privacy_page'
      response.should be_success
    end
  end

  describe "GET 'help_page'" do
    it "returns http success" do
      get 'help_page'
      response.should be_success
    end
  end

  describe "GET 'terms_page'" do
    it "returns http success" do
      get 'terms_page'
      response.should be_success
    end
  end

  describe "GET 'cookies_page'" do
    it "returns http success" do
      get 'cookies_page'
      response.should be_success
    end
  end

  describe "GET 'home_page'" do
    it "returns http success" do
      get 'home_page'
      response.should be_success
    end
  end

end
