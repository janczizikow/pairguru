class PagesController < ApplicationController
  def comment_leaderboard
    @users = User.select("name, COUNT(*) AS comments_count")
      .joins(:comments)
      .where("comments.created_at > ?", Time.zone.today - 7)
      .group(:name)
      .order("comments_count DESC")
      .limit(10)
  end
end
