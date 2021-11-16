class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit

  def current_timestamp
    I18n.l(Time.current, format: :timestamp)
  end
end
