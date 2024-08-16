class Admin::DashboardsController < ApplicationController
  def show
    @ranking = User.joins(:user_level).order('user_levels.points DESC').limit(10)
  end


  def index
    @ranking = User.joins(:user_level)
                   .select('users.*, user_levels.points')
                   .order('user_levels.points DESC')
                   .limit(10) # Mostrando os 10 primeiros colocados
  end
end
