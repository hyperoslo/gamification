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

    describe '#see' do
      let(:reward) { create :reward, seen_at: nil }

      before do
        reward.see
      end

      around do
        Timecop.freeze
      end

      it 'should set seen_at to the current time' do
        expect(reward.seen_at.utc.to_s).to eq Time.now.utc.to_s
      end
    end

    describe '.see' do
      let(:rewards) { create_list :reward, 3, seen_at: nil }

      before do
        rewards.see
      end

      around do
        Timecop.freeze
      end

      it 'should set seen_at to the current time' do
        rewards.each do |reward|
          expect(reward.seen_at.utc.to_s).to eq Time.now.utc.to_s
        end
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
