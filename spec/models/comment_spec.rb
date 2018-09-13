require "rails_helper"

RSpec.describe Comment, type: :model do
  let(:comment) { build(:comment) }

  it { expect(comment).to be_valid }
  it { expect(build(:comment, content: "")).to be_valid }
  it { expect(build(:comment, rating: 0)).not_to be_valid }

  it "allows only one comment per movie/user" do
    movie = create(:movie)
    create(:comment, movie: movie)
    expect(build(:comment, movie: movie)).not_to be_valid
  end
end
