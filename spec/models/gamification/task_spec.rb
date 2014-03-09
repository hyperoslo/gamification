require 'spec_helper'

module Gamification
  describe Task do
    let(:subject) { double }
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

    describe '#complete_for' do
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

    describe '.complete_for' do
      let!(:tasks) { create_list :gamification_task, 3 }

      before do
        expect(Scoring).to receive(:find_by).and_return(Scoring.new).once
        expect(Scoring).to receive(:find_by).and_raise(ActiveRecord::RecordNotFound).at_least(:once)
        expect(Scoring).to receive(:create!).and_return(Scoring.new).at_least(:once)
      end

      it 'creates scorings for tasks that were completed' do
        expect(Task.complete_for(subject).count).to eq 2
      end
    end
  end
end
