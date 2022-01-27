require 'lib/award'

# At the end of each day our system recalculates both values for every award based on business rules.


def update_quality(awards)
  awards.each do |award|
    award.update
  end
end
