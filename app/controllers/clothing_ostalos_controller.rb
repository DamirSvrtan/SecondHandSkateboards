class ClothingOstalosController < ApplicationController
  before_filter :correct_user, only: [:destroy, :edit, :update]
  helper_method :sort_column, :sort_direction

  def new
         @clothing_ostalo = current_user.clothing_ostalos.build if signed_in?
  end

  def index
        @clothing_ostalos = ClothingOstalo.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)
  end

  def show
        @clothing_ostalo=ClothingOstalo.find(params[:id])
  end

  def edit
        @clothing_ostalo=ClothingOstalo.find(params[:id])
  end

  def update
    @clothing_ostalo = ClothingOstalo.find(params[:id])
    if @clothing_ostalo.update_attributes(params[:clothing_ostalo])
      flash[:success] = "Oglas editiran!"
      redirect_to @clothing_ostalo
    else
      render 'edit'
    end
  end

  def create
        @clothing_ostalo = current_user.clothing_ostalos.build(params[:clothing_ostalo])
    if @clothing_ostalo.save
      flash[:success] = "Napravljen oglas!"
      redirect_to clothing_ostalos_path
    else
      render 'clothing_ostalos/new'
    end
  end

  def destroy
        @clothing_ostalo.destroy
        @user=User.find(@clothing_ostalo.user_id)
        redirect_to @user
  end

private

  def correct_user
      @clothing_ostalo = current_user.clothing_ostalos.find_by_id(params[:id])
      redirect_to root_path if @clothing_ostalo.nil?
  end
  
  def sort_column
    ClothingOstalo.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end

