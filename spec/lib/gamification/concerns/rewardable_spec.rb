require 'spec_helper'

describe Gamification::Concerns::Rewardable do
  describe '#medals' do
    let(:user)  { create :user }
    let(:medal) { create :gamification_medal }
    let(:task)  { create :gamification_task, medal: medal }

    before do
      create :gamification_reward, rewardable: user, task: task
    end

    it 'returns medals' do
      expect(user.medals).to eq [medal]
    end
  end
end
