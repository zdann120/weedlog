require "rails_helper"

describe PagesController do
  describe "GET 'root'" do
    it "returns http success" do
      get "root"
      expect(response).to be_successful
    end
  end
end
