require 'rails_helper'

describe "Viewing individual event" do
  let(:event) { create :event }

  it "shows the event details" do
    visit event_url(event)

    expect(page).to have_text(event.name)
    expect(page).to have_text(event.description)
    expect(page).to have_text(event.location)
    expect(page).to have_text(event.starts_at)
    expect(page).to have_text(event.price)
  end

end
