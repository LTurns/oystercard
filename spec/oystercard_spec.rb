require 'oystercard'

describe Oystercard do

  let(:station) { double }
  #before(:each) #{ subject.top_up(Oystercard::MINIMUM_BALANCE)}

  it 'shows balance' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do

    it 'can top up balance' do
      expect { subject.top_up(Oystercard::MINIMUM_BALANCE) }.to change { subject.balance }.by Oystercard::MINIMUM_BALANCE
    end

  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{ subject.top_up(maximum_balance) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end
  end

describe '#touch_in?' do

  it 'shows if card in journey' do
    minimum_balance = Oystercard::MINIMUM_BALANCE
    subject.top_up(minimum_balance)
   expect { subject.touch_in?(station) }.to change { subject.in_journey }.to true
  end

  it 'will not touch in if below minimum balance' do
    subject.top_up(0.5)
    expect{ subject.touch_in?(station) }.to raise_error "Insufficient balance to touch in"
  end

  it 'should remember the station upon touch_in' do
    subject.top_up(Oystercard::MINIMUM_BALANCE)
    expect(subject.touch_in? station).to eq station
  end

  it 'should set entry_station to nil on touch_out' do
    subject.top_up(Oystercard::MINIMUM_BALANCE)
    subject.touch_in?(station)
    subject.touch_out?
    expect(subject.entry_station).to eq(nil)
  end

end

describe '#touch_out?' do

  it 'shows if card in journey ' do
    subject.touch_out?
    expect(subject.in_journey).to eq false
  end

  it 'deducts an amount from balance on touch out' do
    expect { subject.touch_out? }.to change { subject.balance }.by -Oystercard::CHARGE
  end

  it 'charges journey on touch_out method' do
    expect { subject.touch_out? }.to change { subject.balance }.by -Oystercard::CHARGE
  end
end
end
