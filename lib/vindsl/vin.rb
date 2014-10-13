require 'vindsl/wmi'
require 'vindsl/alphabet'

module Vindsl
  class VIN
    def initialize(vin)
      @vin = vin.upcase
    end

    def wmi
      @vin[0..3]
    end

    def country
      WMI.country_for @vin
    end

    def manufacturer
      WMI.manufacturer_for @vin
    end

    def model_year
      year_character = position(10)
      base = pre_2009? ? 1980 : 2010

      base + Vindsl::Alphabet::ALPHABET_FOR_YEARS.index(year_character)
    end

    private
    def position(n)
      @vin[n-1]
    end

    def pre_2009?
      position(7) =~ /\d/
    end
  end
end
