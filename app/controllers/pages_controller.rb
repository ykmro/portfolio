class PagesController < ApplicationController
  def top
    if session[:choice_ids]
      session[:choice_ids] = []
    end

    @situations = Situation.all
  end

  def terms
  end
end
