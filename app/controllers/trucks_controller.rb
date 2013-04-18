class TrucksController < ApplicationController
  before_filter :correct_user, only: [:destroy, :edit, :update]
  helper_method :sort_column, :sort_direction

  def new
         @truck = current_user.trucks.build if signed_in?
  end

  def index
        @trucks = Truck.order(sort_column + " " + sort_direction)
        @users = User.all
	@trucks = @trucks.paginate(:page => params[:page], :per_page => 10)

  end

  def show
        @truck=Truck.find(params[:id])
  end

  def edit
        @truck=Truck.find(params[:id])
  end

  def update
    @truck = Truck.find(params[:id])
    if @truck.update_attributes(params[:truck])
      redirect_to @truck
    else
      render 'edit'
    end
  end

  def create
        @truck = current_user.trucks.build(params[:truck])
	@deck = current_user.decks.build(params[:deck])
	@wheel = current_user.wheels.build(params[:wheel])
    if @truck.save
      redirect_to trucks_path
    else
      render 'trucks/new'
    end
  end

  def destroy
        @truck.destroy
        @user=User.find(@truck.user_id)
        redirect_to @user
  end

private

  def correct_user
      @truck = current_user.trucks.find_by_id(params[:id])
      redirect_to root_path if @truck.nil?
  end
  
  def sort_column
    Truck.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end

