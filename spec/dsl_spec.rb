require 'vindsl/dsl'

describe Vindsl::DSL do
  let(:scarlet){ '1ZVBP8AM7C5280000' }
  let(:yellow){ 'JA3AY11A2VU000000' }
  subject do
    Vindsl::DSL.new do |vin|
      vin.country = 'United States'
      vin.manufacturer = 'Ford'
      vin.model_year = 2012
    end
  end

  it 'provides a VIN regexp' do
    expect(scarlet).to match subject.regexp
    expect(yellow).to_not match subject.regexp
  end

  it 'provides a WMI regexp' do
    expect(scarlet[0..3]).to match subject.wmi_regexp
    expect(yellow[0..3]).to_not match subject.wmi_regexp
  end
end
