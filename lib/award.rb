class Award
  QUALITY_FREEZE = 0
  QUALITY_DEGRADATION_RATE = { active: -1, expired: -2 }
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
    QUALITY_DEGRADATION_RATE[active? ? :active : :expired]
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


  ### BlueFirst ##################

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


  ### BlueCompare ################

  class BlueCompare  < Award
    def update
      update_quality
      update_expires_in
    end
  end


  ### BlueDistinctionPlus ########

  class BlueDistinctionPlus  < Award
    def update
      update_quality
    end
    
  end


  ### BlueStar ###################

  class BlueStar  < Award
    QUALITY_DEGRADATION_RATE_SCALER = 2
    def update
      update_quality
      update_expires_in
    end
  end

end