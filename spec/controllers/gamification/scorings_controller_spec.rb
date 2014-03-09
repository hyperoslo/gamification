require 'spec_helper'

module Gamification
  describe ScoringsController do
    routes { Gamification::Engine.routes }

    describe "POST 'create'" do
      let(:article) { create :article }
      let(:subject) { create :user }

      before do
        create :gamification_task, taskable: article
      end

      before do
        post 'create', redirect_url: 'http://example.org', scoring: {
          taskable_type: article.class.name,
          taskable_id: article.id,
          subjectable_type: subject.class.name,
          subjectable_id: subject.id
        }
      end

      it 'should create a scoring' do
        expect(Scoring.count).to eq 1
      end

      it 'should redirect' do
        expect(response).to be_redirect
      end
    end

  end
end
