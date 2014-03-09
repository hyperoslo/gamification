require 'spec_helper'

describe ArticlesController do

  describe "GET 'show'" do
    let(:article) { create :article }
    
    it 'returns http success' do
      get 'show', id: article.id

      response.should be_success
    end
  end

end
