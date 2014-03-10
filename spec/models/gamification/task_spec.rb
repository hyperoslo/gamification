require 'spec_helper'

module Gamification
  describe Task do
    let(:subject) { create :user }
    let(:task) { create :gamification_task }

    describe '#completed_by?' do
      context 'for a task that is completed by the given subject' do
        before do
          create :gamification_reward, task: task, rewardable: subject
        end

        it 'returns true' do
          expect(task).to be_completed_by subject
        end
      end

      context 'for a task that is not completed by the given subject' do
        it 'returns false' do
          expect(task).not_to be_completed_by subject
        end
      end
    end

    describe '#complete_for' do
      context 'for a task that is not yet completed' do
        it 'creates a reward for the given subject' do
          expect(task.complete_for subject).to be_instance_of Reward
        end
      end

      context 'for a task that is already completed' do
        before do
          create :gamification_reward, task: task, rewardable: subject
        end

        it 'raises an error' do
          expect { task.complete_for subject}.to raise_error Task::Completed
        end
      end
    end

    describe '.complete_for' do
      let!(:tasks) { create_list :gamification_task, 3 }

      before do
        create :gamification_reward, task: tasks.first, rewardable: subject
      end

      it 'creates rewards for tasks that were completed' do
        expect(Task.complete_for(subject).count).to eq 2
      end
    end

    describe '.completed_by' do
      let!(:complete_task)   { create :gamification_task }
      let!(:incomplete_task) { create :gamification_task }

      before do
        complete_task.complete_for subject
      end

      it 'returns completed tasks by a given subject' do
        expect(Task.completed_by(subject).count).to eq 1
      end
    end

    describe '.incomplete_by' do
      let!(:incomplete_tasks) { create_list :gamification_task, 2 }

      it 'returns incomplete tasks by a given subject' do
        expect(Task.incomplete_by(subject).count).to eq 2
      end
    end
  end
end
