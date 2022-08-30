class RoutesController < ApplicationController
  before_action :set_route, only: %i[show edit update destroy]

  def index
    @routes = policy_scope(Route)
  end

  def show
    authorize @route
  end

  def new
    @route = Route.new
    authorize @route
  end

  def create
    @route = Route.new(route_params)
    @route.user = current_user
    authorize @route
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
    authorize @route
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
