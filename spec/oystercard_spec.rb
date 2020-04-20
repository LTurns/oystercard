require 'oystercard'

describe Oystercard do
  describe '#balance' do
    it 'shows balance' do
      expect(subject.balance).to eq 0
    end
  end
end
