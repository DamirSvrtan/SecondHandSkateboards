class SkatesController < ApplicationController
  before_filter :correct_user, only: [:destroy, :edit, :update]
  helper_method :sort_column, :sort_direction

  def new
         @skate = current_user.skates.build if signed_in?
  end

  def index
        @skates = Skate.order(sort_column + " " + sort_direction)
        @users = User.all
	@skates = @skates.paginate(:page => params[:page], :per_page => 10)

  end

  def show
        @skate=Skate.find(params[:id])
  end

  def edit
        @skate=Skate.find(params[:id])
  end

  def update
    @skate = Skate.find(params[:id])
    if @skate.update_attributes(params[:skate])
      redirect_to @skate
    else
      render 'edit'
    end
  end

  def create
        @wheel = current_user.wheels.build(params[:wheel])
	@deck = current_user.decks.build(params[:deck])
        @truck = current_user.trucks.build(params[:truck])
	@skate = current_user.skates.build(params[:skate])
	@skate_ostalo = current_user.skate_ostalos.build(params[:skate_ostalo])
        @shoe = current_user.shoes.build(params[:shoe])
        @hat = current_user.hats.build(params[:hat])
	@garment = current_user.garments.build(params[:garment])
        @clothing_ostalo = current_user.clothing_ostalos.build(params[:clothing_ostalo])

    if @skate.save
      redirect_to skates_path
    else
      render 'skates/new'
    end
  end

  def destroy
        @skate.destroy
        @user=User.find(@skate.user_id)
        redirect_to @user
  end

private

  def correct_user
      @skate = current_user.skates.find_by_id(params[:id])
      redirect_to root_path if @skate.nil?
  end
  
  def sort_column
    Skate.column_names.include?(params[:sort]) ? params[:sort] : "daska_marka"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end

