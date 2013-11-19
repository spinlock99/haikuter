class HaikuController < ApplicationController
  before_filter :authenticate_user!

  def create
    params.permit!
    @haiku = current_user.haikus.build(params[:haiku])
    if @haiku.save
      flash[:success] = "Haiku Saved"
    else
      flash[:error] = "Haiku Not Saved" << @haiku.errors.inspect
    end
    redirect_to @haiku
  end
  def show
    params.permit!
    @haiku = Haiku.find(params[:id])
  end
end
