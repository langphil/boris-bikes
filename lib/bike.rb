class Bike

  def working?
    true
  end

  def report_broken
    @broken = true
  end

  def fix_bike
    @broken = false
  end

  def broken?
    @broken
  end

end
