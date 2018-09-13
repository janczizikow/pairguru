require "rails_helper"

RSpec.describe CommentDecorator do
  let(:comment) { create(:comment).decorate }

  it "returns date in formatted date" do
    expect(comment.created_at).to eq Time.zone.now.strftime("%d %b,  %Y")
  end
end
