require 'rails_helper'

RSpec.describe Event, type: :model do

  describe "associations with user" do
    let(:user) { create :user }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_and_belong_to_many (:themes) }
  end

  describe "association with theme" do
  #  let(:event) { create :event }
  it { is_expected.to have_and_belong_to_many :themes }
  end

  describe "association with ticket" do
  let(:attendant) { create :user, email: "attendant@user.com" }
  let(:organizer) { create :user, email: "organizer@user.com" }

  let!(:event) { create :event, user: organizer }
  let!(:ticket) { create :ticket, event: event, user: attendant }

    it "has attendants" do
      expect(event.users).to include(attendant)
    end
  end

  describe "#bargain?" do
    let(:bargain_event) { create :event, price: 15 }
    let(:non_bargain_event) { create :event, price: 99 }

    it "returns true if price is smaller or equal to EUR 30" do
      expect(bargain_event.bargain?).to eq(true)
      expect(non_bargain_event.bargain?).to eq(false)
    end
  end

  describe ".order_by_price" do
    let!(:event1) { create :event, price: 100 }
    let!(:event2) { create :event, price: 200 }
    let!(:event3) { create :event, price: 50 }

    it "returns a sorted array of events by price" do
      # note that they should not come out in the order that they were created
      expect(Event.order_by_price).to eq([event3, event1, event2])
    end
  end

  describe "validations" do

    # THIS IS THE shoulda-matchers GEM AT WORK
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:starts_at) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }

    # THIS IS HOW TO VALIDATE IT WITHOUT A GEM
    # it "is invalid without a name" do
    #   event = Event.new(name: "")
    #   event.valid?
    #   expect(event.errors).to have_key(:name)
    # end
    #
    # it "is invalid without a location" do
    #   event = Event.new(location: "")
    #   event.valid?
    #   expect(event.errors).to have_key(:location)
    # end
    #
    # it "is invalid without starts_at" do
    #   event = Event.new(starts_at: "")
    #   event.valid?
    #   expect(event.errors).to have_key(:starts_at)
    # end
    #
    # it "is invalid with a description longer than 500 characters" do
    #   event = Event.new(description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum #  passages, and more recently with desktop publishing softwareLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset #  #  sheets containing Lorem Ipsum passages, and more recently with desktop publishing software Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s #   with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
    #   event.valid?
    #   expect(event.errors).to have_key(:description)
    # end
  end
end
