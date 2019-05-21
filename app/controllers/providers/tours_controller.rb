class Providers::ToursController < ApplicationController
  def index
    tours = policy_scope(Tour).order(created_at: :desc)
    @tours = tours.where(provider: current_user)
  end

  def edit
    @tour = Tour.find(params[:id])
    authorize @tour
  end

  def update
  end

  def destroy
    @tour = Tour.find(params[:id])
    authorize @tour
    @tour.destroy

    redirect_to providers_tours_path
  end
end
