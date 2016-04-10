class ArmiesController < ApplicationController
  
  helper_method :army

  def new
    @army = Army.new
  end

  def create
    @army = Army.create(army_params)
    redirect_to new_army_path

  end

  def show
    @battle = Army.find(params[:id])
  end

  private


  def battle
    @army ||= Army.where(id: params[:id]).last
  end

  def army_params
    params.require(:army).permit(:name, :infantry, :archers, :knights, :spending_balance)
  end

end
