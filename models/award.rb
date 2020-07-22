class Award
  attr_accessor :name, :expires_in, :quality

  def initialize(name, expires_in, quality)
    self.name = name
    self.expires_in = expires_in
    self.quality = quality
  end

  def expired?
    expires_in < 0
  end

  def update_expired_award_quality
    if name == 'Blue First'
      self.quality += 1 if quality < 50
    elsif name != 'Blue Compare'
      if quality > 0
        self.quality -= (name == "Blue Star") ? 2 : 1
      end
    else
      self.quality = 0
    end
  end

  def update_unexpired_award_quality
    if name == "Blue Star"
      self.quality -= 2
    elsif name == "NORMAL ITEM"
      self.quality -= 1
    else
      self.quality += 1
    if name == 'Blue Compare'
      self.quality += 1 if expires_in < 10
      self.quality += 1 if expires_in < 5
    end
  end
end
  
end