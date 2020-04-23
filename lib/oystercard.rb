
class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  CHARGE = 0.5
  attr_reader :balance, :in_journey, :entry_station, :exit_station, :list_of_journeys

  def initialize
    @balance = 0
    @in_journey = false
    @list_of_journeys = {}
  end

  def top_up(value)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + value > MAXIMUM_BALANCE
    @balance += value
  end

 def touch_in?(station)
   fail "Insufficient balance to touch in" if @balance < MINIMUM_BALANCE
   @in_journey = true
   @entry_station = station
  @list_of_journeys[:entry_station] = station
 end

  def touch_out?(station)
    @in_journey  = false
    deduct(CHARGE)
    @entry_station = nil
    @exit_station = station
    @list_of_journeys[:exit_station] = station
  end


  private

  def deduct(amount)
    @balance -= amount
  end

end
