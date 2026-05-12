class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  # before_action :maintenance_mode

  private

  def maintenance_mode
    render "maintenance", layout: false
  end
end
