require 'vindsl/alphabet'
require 'vindsl/wmi'

module Vindsl
  class DSL
    attr_accessor :country, :manufacturer, :model_year
    def initialize
      yield self
    end

    def regexp
      Regexp.new "^#{ wmi_regexp }[#{Alphabet::ALPHABET_WITH_NUMBERS.join}]{14}$"
    end

    def wmi_regexp
      country_prefixes = WMI.country_prefixes_for country
      manufacturer_prefixes = WMI.manufacturer_prefixes_for manufacturer
      prefix_pairs = country_prefixes.product manufacturer_prefixes
      ok_prefixes = prefix_pairs.select { |(c, m)| Regexp.new(c).match m}
      chunks = ok_prefixes.map do |(_c, pfx)|
        need_dots = 3 - pfx.length 
        pfx + ('.' * need_dots)
      end

      "(#{chunks.join '|'})"
    end
  end
end
