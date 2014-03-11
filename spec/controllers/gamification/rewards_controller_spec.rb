require 'spec_helper'

module Gamification
  describe RewardsController do
    routes { Gamification::Engine.routes }

    describe "POST 'create'" do
      let(:article) { create :article }
      let(:subject) { create :user }

      before do
        create :gamification_task, rewarding: article
      end

      before do
        post 'create', redirect_url: 'http://example.org', reward: {
          rewarding_type: article.class.name,
          rewarding_id: article.id,
          rewardable_type: subject.class.name,
          rewardable_id: subject.id
        }
      end

      it 'should create a reward' do
        expect(Reward.count).to eq 1
      end

      it 'should redirect' do
        expect(response).to be_redirect
      end
    end

  end
end
