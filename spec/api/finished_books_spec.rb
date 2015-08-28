require 'rails_helper'

RSpec.describe 'list finished books', :type => :request do
  let(:finished){Book.new(title: "finished", finished_at: 10.days.ago)}
  let(:unfinished){Book.new(title: "unfinished", finished_at: nil)}
  it "render JSON finished books" do 
    get '/api/finished_books'
    expect(response.status).to eq(200)

    expect(response.content_type).to eq Mime::JSON
    
    books = JSON.parse(response.body)
    expect(books.size).to eq(1)
  end
end
