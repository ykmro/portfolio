class StudylogsController < ApplicationController
  before_action :require_login

  def index
    current_user.increment_login_streak
    @study_logs = StudyLog.includes(:loggable).order(studied_at: :desc)
    @login_streak = current_user.login_streak
    @total_study_count = @study_logs.count
  end

  def show
    @study_log = StudyLog.find(params[:id])
  end

  private

  def require_login
    unless current_user
      flash[:notice] = "存在しないURLです。"
      redirect_to "/"
    end
  end
end
