class ApplicationController < ActionController::Base
  # before_action :maintenance_mode

  private

  def maintenance_mode
    render "maintenance", layout: false
  end
end
