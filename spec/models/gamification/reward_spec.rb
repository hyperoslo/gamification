require 'spec_helper'

module Gamification
  describe Reward do
    describe '.seen' do
      let(:seen_reward) { create :reward, seen_at: 2.days.ago }
      let(:unseen_reward) { create :reward, seen_at: nil }

      it 'should return seen rewards' do
        expect(described_class.seen).to eq [seen_reward]
      end
    end

    describe '.unseen' do
      let(:seen_reward) { create :reward, seen_at: 2.days.ago }
      let(:unseen_reward) { create :reward, seen_at: nil }

      it 'should return unseen rewards' do
        expect(described_class.unseen).to eq [unseen_reward]
      end
    end

    describe '#seen?' do

      context 'with a reward that has not been seen' do
        let(:reward) { create :reward, seen_at: nil }

        it 'should not be seen' do
          expect(reward).not_to be_seen
        end
      end

      context 'with a reward that has been seen' do
        let(:reward) { create :reward, seen_at: 2.days.ago }

        it 'should be seen' do
          expect(reward).to be_seen
        end
      end
    end
  end
end
