class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  CHARGE = 4
  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + value > MAXIMUM_BALANCE
    @balance += value
  end

 def touch_in?
   fail "Insufficient balance to touch in" if @balance < MINIMUM_BALANCE
   @in_journey = true
 end

  def touch_out?
    @in_journey  = false
    deduct(CHARGE)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
