require 'vindsl/prefix_matcher'

describe Vindsl::PrefixMatcher do
  let(:data){ {'a'=>'a', 'ba' => 'ba', 'bb' => 'bb'} }
  
  subject{ described_class.new data }

  it 'matches a one-character string' do
    expect(subject.find 'a').to eq 'a'
  end

  it 'matches a max-character string' do
    expect(subject.find 'ba').to eq 'ba'
  end

  it 'returns nil on a failed match' do
    expect(subject.find 'c').to be_nil
  end

  describe 'all_prefixes' do
    it 'calculates all prefixes for a string' do
      expect(subject.all_prefixes 'abc').to eq %w{a ab abc}
    end
  end

  describe 'first_prefix' do
    it 'returns the first prefix that matches a hash entry' do
      expect(subject.first_prefix 'abc').to eq 'a'
      expect(subject.first_prefix 'ba').to eq 'ba'
    end

    it 'returns nil on a non-matching prefix' do
      expect(subject.first_prefix 'ccc').to be_nil
    end
  end
end
