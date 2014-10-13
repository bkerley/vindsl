require 'vindsl/vin'

describe Vindsl::VIN do

  describe "Bryce's 2012 Mustang" do
    let(:scarlet){ '1ZVBP8AM7C5280000' }
    subject{ described_class.new scarlet }
    
    it 'looks up the correct country of origin' do
      expect(subject.country).to eq 'United States'
    end
    
    it 'looks up the correct manufacturer' do
      expect(subject.manufacturer).to eq 'Ford'
    end
    
    it 'looks up the correct model year' do
      expect(subject.model_year).to eq 2012
    end
  end

  describe "The old yellow car" do
    let(:yellow){ 'JA3AY11A2VU000000' }
    subject{ described_class.new yellow }

    it 'looks up the correct country of origin' do
      expect(subject.country).to eq 'Japan'
    end
    
    it 'looks up the correct manufacturer' do
      expect(subject.manufacturer).to eq 'Mitsubishi'
    end
    
    it 'looks up the correct model year' do
      expect(subject.model_year).to eq 1997
    end
  end
end
