class RoutesController < ApplicationController
  def index
    @user = current_user
    @routes = Route.all
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
    @route = Route.find(params[:id])
    authorize @route
  end

  def update
    @route = Route.find(params[:id])
    authorize @route
    if Route.update(route_params)
      redirect_to route_path(@flat)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @route = Route.find(params[:id])
    if Route.update(route_params)
      redirect_to routes_path(@route)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def route_params
    params.require(:route).permit(:name, :address)
  end

end
