require 'spec_helper'

module Gamification
  describe Goal do
    let(:subject) { create :user }
    let(:goal) { create :gamification_goal }

    describe '#completed_by?' do
      context 'for a goal that is completed by the given subject' do
        before do
          create :gamification_reward, goal: goal, rewardable: subject
        end

        it 'returns true' do
          expect(goal).to be_completed_by subject
        end
      end

      context 'for a goal that is not completed by the given subject' do
        it 'returns false' do
          expect(goal).not_to be_completed_by subject
        end
      end
    end

    describe '#complete_for' do
      context 'for a goal that is not yet completed' do
        it 'creates a reward for the given subject' do
          expect(goal.complete_for subject).to be_instance_of Reward
        end
      end

      context 'for a goal that is already completed' do
        before do
          create :gamification_reward, goal: goal, rewardable: subject
        end

        it 'raises an error' do
          expect { goal.complete_for subject}.to raise_error Goal::Completed
        end
      end
    end

    describe '.complete_for' do
      let!(:goals) { create_list :gamification_goal, 3 }

      before do
        create :gamification_reward, goal: goals.first, rewardable: subject
      end

      it 'creates rewards for goals that were completed' do
        expect(Goal.complete_for(subject).count).to eq 2
      end
    end

    describe '.completed_by' do
      let!(:complete_goal)   { create :gamification_goal }
      let!(:incomplete_goal) { create :gamification_goal }

      before do
        complete_goal.complete_for subject
      end

      it 'returns completed goals by a given subject' do
        expect(Goal.completed_by(subject).count).to eq 1
      end
    end

    describe '.incomplete_by' do
      let!(:incomplete_goals) { create_list :gamification_goal, 2 }

      it 'returns incomplete goals by a given subject' do
        expect(Goal.incomplete_by(subject).count).to eq 2
      end
    end
  end
end
