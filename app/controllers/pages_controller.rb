class PagesController < ApplicationController
  def home
    if user_signed_in?
      @haiku = current_user.haikus.new
    else
      @haiku = Haiku.new
    end
  end
end
