require 'models/award.rb'

def update_awards(awards) 
  awards.each do |award|
    next if award.name == "Blue Distinction Plus"
    
    award.expires_in -= 1
    
    award.quality = 0 if award.name == "Blue Compare" && award.expired?
    
    next if award.quality.zero? || award.max_quality?

    award.update_unexpired_award_quality
    award.update_expired_award_quality if award.expired?
  end
end

#This isn't something I would ordinarily do, but I didn't want to change the 
#spec, and I felt strongly that "update_quality" wasn't an appropriate method name
alias update_quality update_awards