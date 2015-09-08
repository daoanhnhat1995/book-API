require 'rails_helper'

RSpec.describe "DESTROY Test", :type => :request do

  context 'DESTROY test' do 
    let(:book){Book.create!(title:"Watup")}
    it "destroying books doesnt delete" do
      delete "/api/books/#{book[:id]}"
      expect(response.status).to eq(204)
      book.reload
    end  
  end
end

