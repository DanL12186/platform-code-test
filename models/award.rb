class Award
  attr_accessor :name, :expires_in, :quality

  DECREMENT_QUALITY = { "Blue Star" => 2, "NORMAL ITEM" => 1 }

  def initialize(name, expires_in, quality)
    self.name = name
    self.expires_in = expires_in
    self.quality = quality
  end

  def expired?
    expires_in < 0
  end

  def max_quality?
    quality == 50
  end

  def update_expired_award_quality
    if name == 'Blue First'
      self.quality += 1 unless max_quality?
    else
      self.quality -= DECREMENT_QUALITY[name] || 1
    end
  end

  def update_unexpired_award_quality
    self.quality -= DECREMENT_QUALITY[name] || -1

    if name == 'Blue Compare'
      self.quality += 1 if expires_in < 10
      self.quality += 1 if expires_in < 5
    end
  end
  
end