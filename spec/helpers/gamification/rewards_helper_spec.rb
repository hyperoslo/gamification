require 'spec_helper'

module Gamification
  describe RewardsHelper do
    describe '#present_rewards' do
      let!(:user)   { create :user }
      let!(:reward) { create :reward, seen_at: nil, rewardable: user }

      it 'renders a partial' do
        expect(helper).to receive(:render) do |options|
          expect(options[:partial]).to eq 'gamification/rewards/presentation'
          expect(options[:collection].count).to eq 1
          expect(options[:as]).to eq :reward
        end

        helper.present_rewards for: user
      end
    end
  end
end
