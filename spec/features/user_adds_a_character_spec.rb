require 'rails_helper'

feature 'user_adds_a_character' do
  # As a site visitor
  # I want to add my favorite TV show characters
  # So that other people can enjoy their crazy antics


# Acceptance Criteria:
# [] I can access a form to add a character on a TV show's page
# [] I must specify the character's name and the actor's name
# [] I can optionally provide a description
# [] If I do not provide the required information, I receive an error message
# [] If the character already exists in the database, I receive an error message


scenario 'user adds a new character' do

  show = TelevisionShow.create(
  title: 'Game of Thrones',
  network: 'HBO',
  years: '2011-',
  synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
  )

  attrs1 = {
    name: 'Tyrion Lannister',
    actor: 'Peter Dinklage',
    description: 'occasionally slimy, but nothing on his siblings',
    television_show_id: show.id
  }


  character = Character.new(attrs1)


  visit new_television_show_character_path(:television_show_id => show.id)
  fill_in 'Name', with: character.name
  fill_in 'Actor', with: character.actor
  fill_in 'Description', with: character.description
  click_on 'Submit'

  expect(page).to have_content 'Success'
  expect(page).to have_content character.name
end

scenario 'without required attributes' do

  show = TelevisionShow.create(title: 'Game of Thrones', network: 'HBO', years: '2011-', synopsis: 'Seven noble families fight for control of the mythical land of Westeros.')
  visit new_television_show_character_path(:television_show_id => show.id)
  click_on 'Submit'

  expect(page).to_not have_content 'Success'
  expect(page).to have_content "can't be blank"
end

scenario 'user cannot add a show that is already in the database' do
  show = TelevisionShow.create(title: 'Game of Thrones', network: 'HBO', years: '2011-', synopsis: 'Seven noble families fight for control of the mythical land of Westeros.')

  attrs1 = {
    name: 'Tyrion Lannister',
    actor: 'Peter Dinklage',
    description: 'occasionally slimy, but nothing on his siblings',
    television_show_id: show.id
  }


  character1 = Character.create(attrs1)

  visit new_television_show_character_path(:television_show_id => show.id)
  fill_in 'Name', with: character1.name
  fill_in 'Actor', with: character1.actor
  click_on 'Submit'

  expect(page).to_not have_content 'Success'
  expect(page).to have_content "has already been taken"
end
end
