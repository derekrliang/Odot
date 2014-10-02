require "spec_helper"

describe "Logging in" do

  it "logs the user in and goes to the todo lists" do
    visit new_user_session_path
    User.create(first_name: "Derek", last_name: "Liang", email: "derekliang@gmail.com", password: "derek1", password_confirmation: "derek1")

    fill_in "Email Address", with: "derekliang@gmail.com"
    fill_in "Password", with: "derek1"
    click_button "Log In"

    expect(page).to have_content("Todo Lists")
    expect(page).to have_content("Thanks for logging in!")
  end

  it "displays the email address in the event of a failed login" do
    visit new_user_session_path
    fill_in "Email Address", with: "derekliang@gmail.com"
    fill_in "Password", with: "incorrect"
    click_button "Log In"

    expect(page).to have_content("Please check your email and password")
    expect(page).to have_field("Email", with: "derekliang@gmail.com")
  end

end