require "rails_helper"

RSpec.describe "Comments", type: :request do
  let(:user) { create(:user) }
  let(:movie) { create(:movie) }
  let(:comment) { build(:comment) }

  context "not authenticated" do
    before(:each) do
      visit "/movies/#{movie.id}"
    end

    it "Page has a link to sign in" do
      expect(page).to have_selector("p", text: "You must Log in to add a comment")
    end

    it "Page doesn't have form to add comments" do
      expect(page).to_not have_selector("form", id: "new_comment")
    end
  end

  context "authenticated" do
    before(:each) do
      sign_in user
      visit "/movies/#{movie.id}"
    end

    it "Adds comment successfully" do
      select comment.rating, from: "comment[rating]"
      fill_in "comment[content]", with: comment.content
      click_button "Add comment"
      expect(page).to have_selector("div", id: "flash_notice", text: "Comment added")
    end

    it "Removes comment successfully" do
      select comment.rating, from: "comment[rating]"
      fill_in "comment[content]", with: comment.content
      click_button "Add comment"
      click_link "Remove"
      expect(page).to have_selector("div", id: "flash_notice", text: "Comment removed")
    end
  end
end
