class RoutesController < ApplicationController
  before_action :set_route, only: %i[show edit update destroy]

  def index
    if current_user.walker_status == true && params[:query].present?
      @routes = Route.where(user: current_user).search_by_address(params[:query])
    elsif current_user.walker_status == true
      @routes = Route.where(user: current_user)
    else
      if params[:query].present?
        @routes = Route.search_by_address(params[:query])
      else
        @routes = Route.all
      end
    end
    @markers = @routes.geocoded.map do |route|
      {
        lat: route.latitude,
        lng: route.longitude,
        info_window: render_to_string(partial: "info_window", locals: { route: route }),
        image_url: helpers.asset_url("dog-paw.ico")
      }
    end
  end

  def show
    @record = Record.new
    @markers = [{
      lat: @route.latitude,
      lng: @route.longitude,
      info_window: render_to_string(partial: "info_window", locals: {route: @route}),
      image_url: helpers.asset_url("dog-paw.ico")
    }]
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
  end

  def update
    if @route.update(route_params)
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
    params.require(:route).permit(:name, :address, :photo)
  end
end
