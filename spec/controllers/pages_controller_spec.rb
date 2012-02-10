require 'spec_helper'

describe PagesController do

  describe "GET 'splash'" do
    it "returns http success" do
      get 'splash'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'policy'" do
    it "returns http success" do
      get 'policy'
      response.should be_success
    end
  end

  describe "GET 'terms'" do
    it "returns http success" do
      get 'terms'
      response.should be_success
    end
  end

  describe "GET 'pricing'" do
    it "returns http success" do
      get 'pricing'
      response.should be_success
    end
  end

  describe "GET 'support'" do
    it "returns http success" do
      get 'support'
      response.should be_success
    end
  end

  describe "GET 'sponsors'" do
    it "returns http success" do
      get 'sponsors'
      response.should be_success
    end
  end

end
