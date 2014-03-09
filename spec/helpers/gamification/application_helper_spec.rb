require 'spec_helper'

describe Gamification::ApplicationHelper do
  describe 'complete' do
    let(:article) { create :article }
    let(:user)    { create :user }

    it 'renders a form' do
      form = Capybara.string complete article, for: user

      expect(form).to have_button 'Complete tasks'
    end
  end
end
