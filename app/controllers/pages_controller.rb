class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home instructions]

  def home
  end

  def instructions
  end
end
