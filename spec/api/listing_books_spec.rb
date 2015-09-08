require "rails_helper"

RSpec.describe "books API",:type => :request do
  context "GET /movies" do
    before do 
      Book.create!(title: "Titanic",rating:5)
      Book.create!(title: "Rspec",rating:3)
      Book.create!(title: "Third one",rating:5)
      Book.create!(title: "Not Archived", rating: 1, archived_at: 12.years.ago)
    end
    it "returns all the books not archived" do
        get "/api/books"
      expect(response.status).to eq(200)
      body = JSON.parse(response.body,symbolize_names:true)
      expect(body.size).to eq(3)
      titles = body.map {|m| m[:title]}
      expect(titles).to match_array(["Titanic","Rspec","Third one"])
      ratings = body.map {|m| m[:rating]}
      expect(ratings).to match_array([5,3,5])

    end

    it "return the best books" do
      get "/api/books?rating=5"
      body = JSON.parse(response.body)
      expect(body.size).to eq(2)
    end
  end

end
