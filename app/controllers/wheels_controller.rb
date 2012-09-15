class WheelsController < ApplicationController
  before_filter :correct_user, only: [:destroy, :edit, :update]
  helper_method :sort_column, :sort_direction

  def index
        @wheels = Wheel.order(sort_column + " " + sort_direction)
        @users = User.all
	@wheels = @wheels.paginate(:page => params[:page], :per_page => 10)

  end

  def show
        @wheel=Wheel.find(params[:id])
  end

  def edit
        @wheel=Wheel.find(params[:id])
  end

  def update
    @wheel = Wheel.find(params[:id])
    if @wheel.update_attributes(params[:wheel])
      flash[:success] = "Oglas editiran!"
      redirect_to @wheel
    else
      render 'edit'
    end
  end

  def create
        @wheel = current_user.wheels.build(params[:wheel])
	@deck = current_user.decks.build(params[:deck])
        @truck = current_user.trucks.build(params[:truck])

    if @wheel.save
      flash[:success] = "Napravljen oglas!"
      redirect_to wheels_path
    else
      render 'static_pages/objavi'
    end
  end

  def destroy
        @wheel.destroy
        @user=User.find(@wheel.user_id)
        redirect_to @user
  end

private

  def correct_user
      @wheel = current_user.wheels.find_by_id(params[:id])
      redirect_to root_path if @wheel.nil?
  end
  
  def sort_column
    Wheel.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end

