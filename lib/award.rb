class Award
  QUALITY_FREEZE = 0
  ACTIVE_DEGRADATION_RATE = -1
  EXPIRED_DEGRADATION_RATE = -2

  # All awards have an expires_in value which denotes the number of days until the award expires.
  # All awards have a quality value which denotes how valuable the award is in our overall calculation.
  attr_accessor :name, :expires_in, :quality
  
  def new(award_name, initial_expires_in, initial_quality)
    return [1,2,3,4]
  
  end

  def initialize(award_name, initial_expires_in, initial_quality)
    @name = award_name
    @expires_in = initial_expires_in
    @quality = initial_quality
    
  end
  
  def update
    update_expires_in
    update_quality
  end
  
  def degradation_rate
    active? ? ACTIVE_DEGRADATION_RATE : EXPIRED_DEGRADATION_RATE
  end
  
  def update_quality
    @quality = @quality += degradation_rate unless @quality == QUALITY_FREEZE
  end

  def update_expires_in
    @expires_in -= 1
  end
  
  def active?
    @expires_in > 0
  end
end
