class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home instructions]

  def home
    @products = Product.all
  end

  def instructions
  end
end
