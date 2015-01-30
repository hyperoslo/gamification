require 'spec_helper'

describe Gamification::Checksum do
  describe '.generate' do
    it 'generates checksums' do
      expect(subject.generate(['a', 'b', 'c'])).to eq('412ce96f60d05e18445b84f57a23ae22')
    end
  end

  describe '.verify' do
    it 'verifies checksums' do
      expect(subject.verify('412ce96f60d05e18445b84f57a23ae22', ['a', 'b', 'c'])).to be(true)
    end
  end
end
