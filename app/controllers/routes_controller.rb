class RoutesController < ApplicationController
  before_action :set_route, only: %i[show edit update destroy]

  def index
    @routes = Route.where(user: current_user)
  end

  def show
    @record = Record.new
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      redirect_to routes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if Route.update(route_params)
      redirect_to route_path(@route)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_path, status: :see_other
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, :address)
  end
end
