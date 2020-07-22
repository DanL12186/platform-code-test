require 'models/award'

def update_quality(awards)
  awards.each do |award|
    next if award.name == 'Blue Distinction Plus'

    award.expires_in -= 1

    next if award.quality.zero? || award.quality == 50

    if award.name != 'Blue First' && award.name != 'Blue Compare'
      if award.quality > 0
        award.quality -= (award.name == "Blue Star") ? 2 : 1
      end
    else
      award.quality += 1
      if award.name == 'Blue Compare'
        if award.expires_in < 10
          award.quality += 1
        end
        if award.expires_in < 5
          award.quality += 1
        end
      end
    end

    if award.expires_in < 0
      award.quality -= 1 if award.name == "Blue Star"
        
      if award.name != 'Blue First'
        if award.name != 'Blue Compare'
          if award.quality > 0
            award.quality -= 1
          end
        else
          award.quality = 0
        end
      else
        if award.quality < 50
          award.quality += 1
        end
      end
    end
  end
end
