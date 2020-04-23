require 'station'

RSpec.describe Station do
  subject = Station.new("name", "zone")

    it 'shows on creation' do
    expect(subject.name).to eq "name"
  end
  it 'shows zone on creation' do
   expect(subject.zone).to eq "zone"
  end
end
