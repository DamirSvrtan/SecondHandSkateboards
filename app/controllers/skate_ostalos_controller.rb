class SkateOstalosController < ApplicationController
  before_filter :correct_user, only: [:destroy, :edit, :update]
  helper_method :sort_column, :sort_direction

  def new
         @skate_ostalo = current_user.skate_ostalos.build if signed_in?
  end

  def index
        @skate_ostalos = SkateOstalo.order(sort_column + " " + sort_direction)
        @users = User.all
	@skate_ostalos = @skate_ostalos.paginate(:page => params[:page], :per_page => 10)

  end

  def show
        @skate_ostalo=SkateOstalo.find(params[:id])		      
  end

  def edit
        @skate_ostalo=SkateOstalo.find(params[:id])
  end

  def update
    @skate_ostalo = SkateOstalo.find(params[:id])
    if @skate_ostalo.update_attributes(params[:skate_ostalo])
      redirect_to @skate_ostalo
    else
      render 'edit'
    end
  end

  def create
        @skate_ostalo = current_user.skate_ostalos.build(params[:skate_ostalo])
	@deck = current_user.decks.build(params[:deck])
        @truck = current_user.trucks.build(params[:truck])

    if @skate_ostalo.save
      redirect_to skate_ostalos_path
    else
      render 'skate_ostalo/new'
    end
  end

  def destroy
        @skate_ostalo.destroy
        @user=User.find(@skate_ostalo.user_id)
        redirect_to @user
  end

private

  def correct_user
      @skate_ostalo = current_user.skate_ostalos.find_by_id(params[:id])
      redirect_to root_path if @skate_ostalo.nil?
  end
  
  def sort_column
    SkateOstalo.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end

