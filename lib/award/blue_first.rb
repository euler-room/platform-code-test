class BlueFirst < Award
  QUALITY_FREEZE = 50
  QUALITY_DEGRADATION_RATE = { active: 1, expired: -2 }
  def initialize(award_name, initial_expires_in, initial_quality)
    super(award_name, initial_expires_in, initial_quality)
  end
  def update
    update_quality
    update_expires_in
  end
end
