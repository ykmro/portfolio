class PagesController < ApplicationController
  def top
    @situations = Situation.all
  end
end
