require 'spec_helper'

describe Gamification::ApplicationHelper do
  describe '.reward' do
    let(:article) { create :article }
    let(:user)    { create :user }

    it 'renders a form' do
      form = Capybara.string reward user, for: article

      expect(form).to have_button 'Complete tasks'
    end
  end
end
