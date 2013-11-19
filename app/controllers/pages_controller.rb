class PagesController < ApplicationController
  def home
    @haiku = Haiku.new
  end
end
