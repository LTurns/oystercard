class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = nil
  end

  def top_up(value)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + value > MAXIMUM_BALANCE
    fail "card has insufficient balance to touch-in" if @balance + value < MINIMUM_BALANCE
    @balance += value
  end

  def deduct(amount)
    @balance -= amount
  end

 def touch_in?
   @in_journey = true
 end

  def touch_out?
    @in_journey  = false
  end
end
