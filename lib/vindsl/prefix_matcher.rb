module Vindsl
  class PrefixMatcher
    def initialize(data)
      @data = data
    end

    def find(prefix)
      @data[first_prefix prefix]
    end

    def all_prefixes(str)
      str.length.times.map{|n| str[0..n]}
    end

    def first_prefix(prefix)
      all_prefixes(prefix).detect do |pfx|
        @data[pfx]
      end
    end
  end
end
