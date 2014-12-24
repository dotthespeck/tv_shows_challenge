require 'rails_helper'

feature "user views a TV show's details", %Q{
  As a site visitor
  I want to view the details for a TV show
  So I can find learn more about it
  I can see a the show's title, network, the years it ran, and a synopsis.
} do

  # Acceptance Criteria:
  # * I can see a the show's title, network, the years it ran,
  # and a synopsis.
  #For each character, I can see the character's name, actor's name, and the character's description

  scenario "user views a TV show's details" do
    show = TelevisionShow.create(title: 'Game of Thrones',
      network: 'HBO' )

    visit "/television_shows/#{show.id}"

    expect(page).to have_content show.title
    expect(page).to have_content show.network
    expect(page).to have_content show.years
    expect(page).to have_content show.synopsis
  end

scenario "user views a TV show's details" do
  show = TelevisionShow.create(title: "Game of Thrones", network: "HBO")
  character = Character.create(name: "Tyrion Lannister", actor: "Peter Dinklage", description: "Not as bad as the others")

  visit "/television_shows/#{show.id}"

  expect(page).to have_content character.name
  expect(page).to have_content character.actor
  expect(page).to have_content character.description
  end

end
