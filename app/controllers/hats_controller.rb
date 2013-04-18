class HatsController < ApplicationController
  before_filter :correct_user, only: [:destroy, :edit, :update]
  helper_method :sort_column, :sort_direction

  def new
         @hat = current_user.hats.build if signed_in?
  end

  def index
        @hats = Hat.order(sort_column + " " + sort_direction)
        @users = User.all
	@hats = @hats.paginate(:page => params[:page], :per_page => 10)

  end

  def show
        @hat=Hat.find(params[:id])
  end

  def edit
        @hat=Hat.find(params[:id])
  end

  def update
    @hat = Hat.find(params[:id])
    if @hat.update_attributes(params[:hat])
      redirect_to @hat
    else
      render 'edit'
    end
  end

  def create
        @hat = current_user.hats.build(params[:hat])
	@deck = current_user.decks.build(params[:deck])
        @truck = current_user.trucks.build(params[:truck])

    if @hat.save
      redirect_to hats_path
    else
      render 'hats/new'
    end
  end

  def destroy
        @hat.destroy
        @user=Hat.find(@hat.user_id)
        redirect_to @user
  end

private

  def correct_user
      @hat = current_user.hats.find_by_id(params[:id])
      redirect_to root_path if @hat.nil?
  end
  
  def sort_column
    Hat.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end

