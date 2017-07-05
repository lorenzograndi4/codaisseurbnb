require 'rails_helper'

RSpec.describe User, type: :model do

  describe "association with event" do
    let(:user) { create :user }
    let!(:event) { create :event, user: user }

    it { is_expected.to have_many :events }

    # it "has many events" do
    #     event1 = user.events.new(name: "Wonderful")
    #     event2 = user.events.new(name: "Extraordinary")
    #
    #     expect(user.events).to include(event1)
    #     expect(user.events).to include(event2)
    #   end
    it "deletes associated events" do
      expect { user.destroy }.to change(Event, :count).by(-1)
    end
  end

  describe "association with profile" do
    it { is_expected.to have_one :profile }
    it { is_expected.to have_one(:profile).dependent(:destroy) }

    # it "deletes associated profile" do
    #   expect { user.destroy }.to change(Profile, :count).by(-1)
    # end
  end

end
