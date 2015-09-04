require 'rails_helper'

RSpec.describe "DESTROY Test", :type => :request do

  context 'DESTROY test' do 
    let(:book){Book.create!(title:"Watup")}
    it "delete book" do
      delete "/api/books/#{book[:id]}"
      expect(response.status).to eq(204)
    end  
  end
end

