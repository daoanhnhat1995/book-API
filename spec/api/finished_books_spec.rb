require 'rails_helper'

RSpec.describe 'list finished books', :type => :request do

  before do
   Book.create!(title: "finished", finished_at: 10.days.ago)
   
   Book.create!(title: "unfinished", finished_at: nil)
  end
   it "render JSON finished books" do 
    get '/api/finished_books',{},{'Accept'=>'application/json'}
    expect(response.status).to eq(200)

    expect(response.content_type).to eq Mime::JSON

    books = JSON.parse(response.body)
    expect(books.size).to eq(1)
    titles = books.map {|m| m["title"]}
    expect(titles).to include("finished")
    expect(titles).not_to include("unfinished")

  end
end
