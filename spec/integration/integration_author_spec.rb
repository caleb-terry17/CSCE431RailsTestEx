require 'rails_helper'

RSpec.describe "Creating an Author", type: :feature do
    scenario "valid inputs" do
        # takes me to author page
        visit authors_path

        # create a new author
        click_on "New Author"
        fill_in "Name", with: "John Doe"
        click_on "Create Author"

        # go back authors page
        visit authors_path
        expect(page).to have_content("John Doe")
    end

    scenario "doesn't create author when back button is selected" do
        # takes me to new author page
        visit new_author_path

        # don't create a new author
        fill_in "Name", with: "Jane Doe"
        click_on "Back"

        # go back authors page
        visit authors_path
        expect(page).not_to have_content("Jane Doe")
    end
end