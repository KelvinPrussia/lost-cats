require 'lost_cat_advert'

RSpec.describe LostCatAdvert do
  it "constructs and returns arguments" do
    advert = LostCatAdvert.new("name", "description", "phone number")
    expect(advert.name).to eq "name"
    expect(advert.description).to eq "description"
    expect(advert.phone_number).to eq "phone number"
  end
end
