require 'spec_helper'

describe Luhn do

  let(:partial_number) { 7992739871 }
  let(:invalid_format) { 'd7992739871' }
  let(:valid_complete_number) { 79927398713 }
  let(:invalid_complete_number) { 79927398711 }

  it "Calculates the checksum" do
    expect(Luhn::checksum(partial_number)).to eq 3
  end

  it "Validates checksum" do
    expect(Luhn::valid?(valid_complete_number)).to be true
    expect(Luhn::valid?(invalid_complete_number)).to be false
  end

  it "Raises invalid character error" do
    expect { Luhn::checksum(invalid_format) }.to raise_error('Invalid character')
  end

end
