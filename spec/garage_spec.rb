require 'garage'

describe Garage do

  it { is_expected.to respond_to(:fix_bikes) }

  it "fixes bikes when fix bikes is used" do
    subject.fix_bikes
    expect(subject.bike.working?).to eq true
  end

end
