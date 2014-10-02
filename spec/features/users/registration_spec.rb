require "spec_helper"

describe "Signing up" do
  it "allows a user to sign up for the site and creates the object in the database" do
    expect(User.count).to eq(0)

    visit "/"
    expect(page).to have_content("Sign Up")
    click_link "Sign Up"

    fill_in "First Name", with: "Derek"
    fill_in "Last Name", with: "Liang"
    fill_in "Email", with: "derekliang@gmail.com"
    fill_in "Password", with: "derek12345"
    fill_in "Password (again)", with: "derek12345"
    click_button "Sign Up"

    expect(User.count).to eq(1)
  end
end