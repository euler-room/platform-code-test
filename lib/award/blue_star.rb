class BlueStar  < Award
  QUALITY_DEGRADATION_RATE_SCALER = 2
  def update
    update_quality
    update_expires_in
  end
end