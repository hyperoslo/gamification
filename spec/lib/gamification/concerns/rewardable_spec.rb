require 'spec_helper'

describe Gamification::Concerns::Rewardable do
  describe '#medals' do
    let(:user)  { create :user }
    let(:medal) { create :gamification_medal }
    let(:goal)  { create :gamification_goal, medal: medal }
    let(:goal_without_medal)  { create :gamification_goal }

    describe "when medals earned" do
      before do
        create :gamification_reward, rewardable: user, goal: goal
        create :gamification_reward, rewardable: user, goal: goal_without_medal
      end

      it 'returns medals' do
        expect(user.medals).to eq [medal]
      end
    end

    describe "when no medals earned" do
      it 'returns empty array when no medals' do
        expect(user.medals).to eq []
      end
    end
  end
end
