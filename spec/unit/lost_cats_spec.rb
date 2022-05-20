require 'lost_cats'
require 'lost_cat_advert'

RSpec.describe LostCats do
  it "adds and lists a single advert" do
    advert = LostCatAdvert.new("name", "Description", "Phone Number")
    lost_cats = LostCats.new
    lost_cats.add(advert)
    expect(lost_cats.adverts).to eq [advert]
  end

  it "adds and lists multiple adverts" do
    advert1 = LostCatAdvert.new("Name 1", "Description 1", "Phone Number 1")
    advert2 = LostCatAdvert.new("Name 2", "Description 2", "Phone Number 2")
    advert3 = LostCatAdvert.new("Name 3", "Description 3", "Phone Number 3")
    lost_cats = LostCats.new
    
    lost_cats.add(advert1)
    lost_cats.add(advert2)
    lost_cats.add(advert3)
    expect(lost_cats.adverts).to eq [advert1, advert2, advert3]
  end

  it "removes an advert from the list" do
    advert1 = LostCatAdvert.new("Name 1", "Description 1", "Phone Number 1")
    advert2 = LostCatAdvert.new("Name 2", "Description 2", "Phone Number 2")
    advert3 = LostCatAdvert.new("Name 3", "Description 3", "Phone Number 3")
    
    lost_cats = LostCats.new
    lost_cats.add(advert1)
    lost_cats.add(advert2)
    lost_cats.add(advert3)
    lost_cats.remove(1)
    expect(lost_cats.adverts).to eq [advert1, advert3]
  end

  it "returns a singular advert" do
    advert1 = LostCatAdvert.new("Name 1", "Description 1", "Phone Number 1")
    advert2 = LostCatAdvert.new("Name 2", "Description 2", "Phone Number 2")
    advert3 = LostCatAdvert.new("Name 3", "Description 3", "Phone Number 3")
    
    lost_cats = LostCats.new
    lost_cats.add(advert1)
    lost_cats.add(advert2)
    lost_cats.add(advert3)

    expect(lost_cats.get(0)).to eq advert1
  end

  it "updates and changes an advert" do
    advert1 = LostCatAdvert.new("Name 1", "Description 1", "Phone Number 1")
    advert2 = LostCatAdvert.new("Name 2", "Description 2", "Phone Number 2")
    advert3 = LostCatAdvert.new("Name 3", "Description 3", "Phone Number 3")
    
    lost_cats = LostCats.new
    lost_cats.add(advert1)
    lost_cats.add(advert2)
    lost_cats.add(advert3)

    updated_advert = LostCatAdvert.new("Name 4", "Descroption 4", "Phone Number 4")
    lost_cats.update(1, updated_advert)

    expect(lost_cats.adverts).to eq [advert1, updated_advert, advert3]
  end
end
