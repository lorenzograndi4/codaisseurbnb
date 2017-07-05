require 'rails_helper'

describe "shared/_navbar.html.erb" do
  #  Write an extra test for the navbar that checks if the log in
  #  and sign up links get rendered when the user is not signed in.

  context "when user not signed in" do
      it "shows login and signup links" do
        render
        expect(rendered).to have_content "Log In"
        expect(rendered).to have_content "Sign Up"
      end
  end

  context "without profile" do
    before { sign_in user }
    let(:user) { create :user }

    it "renders email" do
      render
      expect(rendered).to have_content user.email
    end
  end

  context "with profile" do
    before { sign_in user }
    let(:profile) { build :profile }
    let(:user) { create :user, profile: profile }

    it "renders full name" do
      render
      expect(rendered).to have_content profile.first_name
      expect(rendered).to have_content profile.last_name
    end
  end
end
