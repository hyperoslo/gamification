require 'spec_helper'

module Gamification
  describe RewardsHelper do
    describe '#present_rewards' do
      let!(:user)   { create :user }
      let!(:reward) { create :reward, seen_at: nil, rewardable: user }

      it 'renders a partial' do
        expect(helper).to receive(:render) do |options|
          expect(options[:locals]).to eq rewards: [reward]
        end

        helper.present_rewards for: user
      end
    end
  end
end
