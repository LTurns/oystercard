require 'oystercard'

describe Oystercard do
  it 'shows balance' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do

    it 'can top up balance' do
      expect { subject.top_up(1) }.to change { subject.balance }.by 1
    end

  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{ subject.top_up(1) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end
  end

  describe '#deduct' do

    it 'deducts an amount from balance' do
      expect { subject.deduct(3) }.to change { subject.balance }.by -3
    end
  end

describe '#touch_in?' do
  it 'shows if card in journey' do
    minimum_balance = Oystercard::MINIMUM_BALANCE
    subject.top_up(minimum_balance)
   expect { subject.touch_in? }.to change { subject.in_journey }.to true
  end

  it 'will not touch in if below minimum balance' do
    subject.top_up(0.5)
    expect{ subject.touch_in? }.to raise_error "Insufficient balance to touch in"
    #expect { subject.touch_in? }.to change { subject.in_journey }.to false
  end
end

describe '#touch_out?' do
  it 'shows if card in journey ' do
    expect { subject.touch_out? }.to change { subject.in_journey }.to false
  end
end
end


#it 'Person is in a journey if card is tapped in' do 
#  expect { new_card.tap_in }.to change { new_card.in_journey }.from(false).to(true)   end
