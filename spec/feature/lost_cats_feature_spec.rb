RSpec.describe "LostCats Feature", type: :feature do
  context "with an empty lis of adverts" do
    it "says there are no adverts" do
      visit "/lost_cats"
      expect(page).to have_content "There are no adverts."
    end
  end

  it "adds an advert and lists it out" do
    visit "/lost_cats"

    click_link "Add Advert" # click_link works on <a href="..."

    fill_in "Name", with: "Gizmo"
    fill_in "Description", with: "Black and White"
    fill_in "Phone number", with: "07862835385"
    click_button "Post" # click_button works on <input type="submit"... <button>...

    expect(page).to have_content "Gizmo"
    expect(page).to have_content "Black and White"
    expect(page).to have_content "07862835385"
  end

  it "adds multiple adverts and lists them out" do
    visit "/lost_cats"

    click_link "Add Advert"
    fill_in "Name", with: "Stranger"
    fill_in "Description", with: "Ginger and angry"
    fill_in "Phone number", with: "07529102736"
    click_button "Post"

    click_link "Add Advert" 
    fill_in "Name", with: "Gizmo"
    fill_in "Description", with: "Black and White"
    fill_in "Phone number", with: "07862835385"
    click_button "Post" 

    expect(page).to have_content "Gizmo"
    expect(page).to have_content "Black and White"
    expect(page).to have_content "07862835385"
    expect(page).to have_content "Stranger"
    expect(page).to have_content "Ginger and angry"
    expect(page).to have_content "07529102736"
  end

  it "deletes adverts from the list with a correct password" do
    visit "/lost_cats"

    click_link "Add Advert"
    fill_in "Name", with: "Gizmo" 
    fill_in "Description", with: "Black and White"
    fill_in "Phone number", with: "07862835385"
    click_button "Post" 

    click_link "Add Advert"
    fill_in "Name", with: "Stranger"
    fill_in "Description", with: "Ginger and angry"
    fill_in "Phone number", with: "07529102736"
    click_button "Post"

    click_link "Add Advert"
    fill_in "Name", with: "Ruby" 
    fill_in "Description", with: "Brown tabby"
    fill_in "Phone number", with: "07862294144"
    click_button "Post" 

    click_button "delete_1"

    #fill_in "Password", with: "password1"

    expect(page).to have_content "Gizmo"
    expect(page).to have_content "Black and White"
    expect(page).to have_content "07862835385"
    expect(page).not_to have_content "Stranger"
    expect(page).not_to have_content "Ginger and angry"
    expect(page).not_to have_content "07529102736"
    expect(page).to have_content "Ruby"
    expect(page).to have_content "Brown tabby"
    expect(page).to have_content "07862294144"
  end

  it "updates adverts in the list" do
    visit "/lost_cats"

    click_link "Add Advert"
    fill_in "Name", with: "Gizmo" 
    fill_in "Description", with: "Black and White"
    fill_in "Phone number", with: "07862835385"
    click_button "Post" 

    click_link "Add Advert"
    fill_in "Name", with: "Ruby" 
    fill_in "Description", with: "Brown tabby"
    fill_in "Phone number", with: "07862294144"
    click_button "Post" 

    click_link "edit_1" 
    fill_in "Name", with: "Stranger"
    fill_in "Description", with: "Ginger and angry"
    fill_in "Phone number", with: "07529102736"
    click_button "Update"

    expect(page).to have_content "Gizmo"
    expect(page).to have_content "Black and White"
    expect(page).to have_content "07862835385"
    expect(page).to have_content "Stranger"
    expect(page).to have_content "Ginger and angry"
    expect(page).to have_content "07529102736"
    expect(page).not_to have_content "Ruby"
    expect(page).not_to have_content "Brown tabby"
    expect(page).not_to have_content "07862294144"
  end

  it "doesnt allow html to be put into the adverts" do
    visit "/lost_cats"

    click_link "Add Advert" 

    fill_in "Name", with: "Gizmo"
    fill_in "Description", with: "<button>Nefarious deed</button>"
    fill_in "Phone number", with: "07862835385"
    click_button "Post" 

    expect(page).to have_content "Gizmo"
    expect(page).not_to have_button "Nefarious deed"
    expect(page).to have_content "07862835385"
  end
end
