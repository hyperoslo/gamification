require 'spec_helper'

describe 'gamification/rewards/_presentation.html.erb' do
  let!(:goal)   { create :goal, points: 100 }
  let!(:reward) { create :reward, goal: goal }
  let!(:medal)  { create :medal, goal: goal }

  before do
    render partial: 'gamification/rewards/presentation', locals: { reward: reward }
  end

  it 'should contain the name of the medal' do
    expect(rendered).to include medal.name
  end

  it 'should contain the description of the medal' do
    expect(rendered).to include medal.description
  end

  it 'should contain the how many points the goal is worth' do
    expect(rendered).to include goal.points.to_s
  end
end
