class TopsController < ApplicationController
	skip_before_action :require_login
	skip_before_action :require_admin_login
	before_action :require_user_already
	before_action :require_admin_already

  def home
  end

  def about
  end
end
