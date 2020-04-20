require 'oystercard'

describe Oystercard do
  it 'shows balance' do
    expect(subject.balance).to eq 0
  end

end
