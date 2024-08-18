class Admin::RankingsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @ranking = User.includes(:user_level).order('user_levels.points DESC')
  end
end
