class SituationsController < ApplicationController
  def index
    # トップページで一覧表示
  end

  def show
    situations = Situation.all
    @situation = situations.find(params[:id])
    @step = @situation.steps.first
  end

  def result
    # セッションで保持した選択肢を一覧表示
    sessions = session[:choice_ids]
    @choices = Choice.where(id: sessions)
    # セッションを破棄
    # session[:choice_ids] = []
  end
end
