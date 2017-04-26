require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  {
    :winter => {
      :christmas => ["Lights", "Wreath"],
      :new_years => ["Party Hats"]
    },
    :summer => {
      :fourth_of_july => ["Fireworks", "BBQ"]
    },
    :fall => {
      :thanksgiving => ["Turkey"]
    },
    :spring => {
      :memorial_day => ["BBQ"]
    }
  }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  # binding.pry
  #i used binding,pry...it's possible for the reference to be established, but with no
  # empy space beside it. arrays are actually two parts, with a reference and an array.
  # i tried to push supply array with a shovel operator. but, although it looked like
  # i had established holiday_name, it was only its name that had been established.
  # there was no corresponding space. so i got a nil error
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash


end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  x = []
  holiday_hash.each do  |season, holiday|
    if season == :winter
    holiday.each do  |holiday, supply|

      # binding.pry
      x << supply
    end
  end
  end
  x.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday_name|
    puts "#{season.to_s.capitalize}:"
      holiday_name.each do |holiday_name, supplies|
        if holiday_name.to_s.include?("_")
          # here i have to split the name that contain an underscore,
          # then capitalize the different strings
           formatted = holiday_name.to_s.split("_")
           formatted2 = []

            formatted.each do |word|
              formatted2 << word.capitalize
            end
           puts "  #{formatted2.join(" ")}: #{supplies.join(", ")}"

        else
            puts "  #{holiday_name.to_s.capitalize}: #{supplies.join(", ")}"
        end
  end

  end

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  x = []
  holiday_hash.each do |season, holiday_name|
    holiday_name.each do |holiday_name, supply|
      if supply.include?("BBQ")
        x << holiday_name
      end
    end
  end
x
end
