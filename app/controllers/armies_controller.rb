class ArmiesController < ApplicationController
  helper_method :army

  def new
    @army = Army.new
  end

  def create
    @army = Army.create(army_params)
    redirect_to new_army_path
    flash[:notice] = 'army successfully saved'
  end

  def show
    @army = Army.find(params[:id])
  end

  private

  def battle
    @army ||= Army.where(id: params[:id]).last
  end

  def army_params
    params.require(:army).permit(
      :name,
      :infantry,
      :archers,
      :knights,
      :spending_balance
    )
  end
end
