class SituationsController < ApplicationController
  def index
    # パラメータで渡ってきたIDのタイトルやあらすじ、サムネイルを取得して表示
  end

  def result
    # パラメータで渡ってきたID、セッションで渡ってきた回答IDを取得して結果を表示
  end
end
