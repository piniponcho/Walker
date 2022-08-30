class RoutesController < ApplicationController
  before_action :set_route, only: %i[show edit update delete]

  def index
    @routes = Route.where(user: current_user)
  end

  def show
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    @route.user = current_user
    if @route.save
      redirect_to routes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @route
  end

  def update
    authorize @route
    if Route.update(route_params)
      redirect_to route_path(@route)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if Route.update(route_params)
      redirect_to routes_path(@route)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, :address)
  end
end
