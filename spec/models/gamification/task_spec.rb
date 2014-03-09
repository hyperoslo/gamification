require 'spec_helper'

module Gamification
  describe Task do
    let(:subject) { mock }
    let(:task) { create :gamification_task }

    describe '#completed_by?' do
      context 'for a task that is not completed by the given subject' do
        before do
          expect(Scoring).to receive(:find_by).with(subjectable: subject).and_return(Scoring.new)
        end

        it 'returns true' do
          expect(task).to be_completed_by subject
        end

      end

      context 'for a task that is not completed by the given subject' do
        before do
          expect(Scoring).to receive(:find_by).with(subjectable: subject).and_raise(ActiveRecord::RecordNotFound)
        end

        it 'returns false' do
          expect(task).not_to be_completed_by subject
        end

      end
    end

    describe 'complete_for' do
      context 'for a task that is not yet completed' do
        before do
          expect(Scoring).to receive(:find_by).with(subjectable: subject).and_raise(ActiveRecord::RecordNotFound)
          expect(Scoring).to receive(:create!).with(task: task, subjectable: subject).and_return(Scoring.new)
        end

        it 'creates a scoring for the given subject' do
          expect(task.complete_for subject).to be_instance_of Scoring
        end
      end

      context 'for a task that is already completed' do
        before do
          expect(Scoring).to receive(:find_by).with(subjectable: subject).and_return(Scoring.new)
        end

        it 'creates a scoring for the given subject' do
          expect { task.complete_for subject}.to raise_error Task::Completed
        end
      end
    end
  end
end
