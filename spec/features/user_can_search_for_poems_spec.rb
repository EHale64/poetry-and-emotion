require 'rails_helper'

RSpec.describe "User can search" do
  it "type in an author name" do
    visit '/'

    expect(page).to have_field("Enter Author Name")

    fill_in :author, with: "Emily"
    click_on 'Get Poems'

    expect(current_path).to eq(search_path)

    expect(page).to have_css('.poem', count:10)

    within(first('.poem')) do
      expect(page).to have_css('.title')
      expect(page).to have_css('.author')
      expect(page).to have_css('.lines')
      expect(page).to have_css('.tone')
    end
  end
end

# As a user - done
# When I visit "/" - done
# And I fill in "Emily" in the textfield(Note: Use the existing search form) - done
# And I click "Get Poems" - done
# Then I should be on page "/search" -done
# Then I should see a list of the first 10 poems -done
# Then I should see the tone or tones listed for each poem.
# For each poem I should see
# - Title - done
# - Author - done
# - The poem(as a single string) - done
# I should also see:
# - The tone or tones for each poem
