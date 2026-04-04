class SituationsController < ApplicationController
  def index
    # トップページで一覧表示
  end

  def show
    situations = Situation.all
    @situation = situations.find(params[:id])
    @step = @situation.steps.find_by(step_number: 1)
  end

  def result
    # パラメータで渡ってきたID、セッションで渡ってきた回答IDを取得して結果を表示
  end
end
