require 'rails_helper'

RSpec.describe "POST test" ,:type => :request do
 context "create books with valid attributes" do
   before(:each) do 
     post '/api/books', {book: {title: "Try", rating: 4}}.to_json,
      { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

   end
  it "can create a book" do
    expect(response.status).to eq(201)

  end
  it "repond to the right book" do
    book = JSON.parse(response.body)
    expect(api_book_url(book["id"])).to eq(response.location)
  end

 end
 context "does not create books without a title" do
   it 'cant post without title' do  
     post '/api/books', {book: {title: nil, rating: 1}}.to_json,
        {'Accept' => 'application/json', 'Content-Type' => 'application/json'}
      expect(response.status).to eq(422)
   end
 end

end
